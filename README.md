# EducambiAPI

## 🧠 **Objetivo da Plataforma Educambi**
Criar um sistema que:
- Prepare adolescentes e adultos de baixa renda no Brasil para o ambiente acadêmico e de pesquisa científica.
- Disponibilize aulas (científicas e pré-vestibular), materiais de apoio, eventos, documentários, lives e interações com comunidade e professores.
- Seja simples, funcional, esteticamente agradável e com custo reduzido.

---

## ⚙️ **Tecnologias Sugeridas**
### 🔹 Frontend:
- **Angular**: escolhido por @programanda03 por já ter experiência (1 ano) trabalhando com Angular.

### 🔹 Backend:
- **Go (Golang)** monolítico: ideal pela performance, fácil deploy e boa manutenção com equipe pequena.

### 🔹 Banco de Dados:
- **PostgreSQL** (recomendado em vez de MySQL):
    - Melhor modelagem de dados complexos.
    - Suporte robusto a JSON, relacionamentos e regras de integridade.
    - Melhor para notificações, permissões e queries sofisticadas.
- **MongoDB** (opcional para comentários, fórum/discussões se quiser mais flexibilidade).

---

## ☁️ **Infraestrutura e Deploy**
- 2 ou 3 ambientes: **DEV**, **STAGING (opcional)**, **PROD**.
- CI/CD com **GitHub Actions**.
- Serviços de cloud com **baixo custo** sugeridos:
    - **Render** ou **Railway** (backend, PostgreSQL, MongoDB)
    - **Netlify**, **Vercel** ou **Firebase Hosting** (frontend Angular)
    - **Logtail**, **BetterStack**, **Grafana/Prometheus** (monitoramento/logs)
    - **Supabase** (se quiser banco + storage + autenticação gratuita)

---

## 🗂️ **Requisitos de Funcionalidades (C1–C21)**
Foram listadas 21 características importantes da plataforma, entre elas:

- Aulas separadas por tipo (C1, C2), com materiais de apoio e artigos (C9).
- Documentários, lives, conteúdos didáticos, eventos e revista da USP (C3–C7).
- Fórum de discussão com verificação de respostas de professores (C11).
- Gestão de disciplinas, aulas, eventos, documentários e materiais (C12–C17).
- Perfis de professores e controle de permissões (C18–C20).
- Notificações sobre dúvidas, respostas e eventos (C21).

---

## ✅ Conclusão Técnica
- A arquitetura proposta é sólida para o time reduzido (até 4 pessoas).
- O uso de **Go + PostgreSQL + Angular** é coerente, com bom equilíbrio entre performance, segurança e escalabilidade.
- Plataformas como **Render**, **Supabase**, **Railway** e **Netlify** são ideais para reduzir custos com bom suporte a CI/CD.
- O modelo está pronto para evoluir para algo maior, se o projeto escalar.

---