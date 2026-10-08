// Lista as pastas do OS que têm notas (.md/.txt), com a quantidade de arquivos.
// Só caminhos e contagens — não lê o conteúdo de nenhuma nota.
//   node skills/os/cerebro-3d/scripts/descobrir.mjs --root .
import {promises as fs} from 'node:fs';
import path from 'node:path';

const at = process.argv.indexOf('--root');
const root = path.resolve(at >= 0 ? process.argv[at + 1] : process.cwd());

const CANDIDATAS = [
  ['Pessoas', 'conhecimento/paginas/pessoas'],
  ['Empresas', 'conhecimento/paginas/empresas'],
  ['Temas', 'conhecimento/paginas/temas'],
  ['Projetos', 'projetos'],
  ['Decisões', 'decisoes'],
  ['Empresa (DNA, ICP, áreas)', 'empresa'],
  ['Sobre mim', '0-eu'],
  ['Rotinas', 'rotinas'],
  ['Saídas e diário', 'saidas'],
  ['Conexões', 'conexoes'],
  ['Minhas skills', 'skills/minhas'],
  ['Bruto (transcrições, exportações) — fora por padrão', 'conhecimento/raw'],
];
const PULAR = new Set(['node_modules', '.git', '_arquivo', 'dist', 'apps']);

async function contar(dir) {
  let n = 0;
  let entradas;
  try { entradas = await fs.readdir(dir, {withFileTypes: true}); } catch { return 0; }
  for (const e of entradas) {
    if (e.name.startsWith('.') || PULAR.has(e.name) || e.isSymbolicLink()) continue;
    const p = path.join(dir, e.name);
    if (e.isDirectory()) n += await contar(p);
    else if (/\.(md|txt)$/i.test(e.name) && e.name.toLowerCase() !== 'readme.md') n += 1;
  }
  return n;
}

const candidatas = [];
for (const [rotulo, rel] of CANDIDATAS) {
  const abs = path.join(root, rel);
  try { if (!(await fs.stat(abs)).isDirectory()) continue; } catch { continue; }
  candidatas.push({categoria: rotulo, pasta: rel, notas: await contar(abs)});
}
console.log(JSON.stringify({root, candidatas, aviso: 'Só caminhos e contagens. Pergunte o nome e as categorias ao usuário antes de gerar.'}, null, 2));
