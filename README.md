# Projeto NewFase - Análise de Pedidos e Entregas

## 📌 Introdução

O projeto **NewFase - Dados** tem como objetivo praticar **Análise de Dados baseada em Projetos**, adotando uma metodologia **hands-on** para consolidar conceitos de Engenharia e Ciência de Dados.

Na primeira etapa, foi utilizada uma base fictícia de entregas (shipments) com **2000 registros**, armazenada em um banco **PostgreSQL local** e carregada via script **Python**.

## 🗂️ Estrutura do Projeto

```
NewFase-Dados/
│── data/                # Contém os arquivos CSV originais
│── sql/                 # Scripts SQL (consultas de sanidade, exploração e modelagem)
│── load_data.py         # Script Python para ingestão dos dados no PostgreSQL
│── .env                 # Variáveis de ambiente para conexão ao banco
│── README.md            # Documentação do projeto
```

## ✅ Etapa A — Preparação (concluída em 20/08/2025)

1. Criação do banco PostgreSQL local `newfase`.
2. Criação da tabela staging `stg_dados`.
3. Carregamento do CSV via **Python + Pandas + SQLAlchemy**, utilizando boas práticas:
   - Variáveis de ambiente para credenciais do banco.
   - Estrutura de projeto versionada no Git.
   - Padronização de diretórios (`data/`, `sql/`).
4. Execução de consultas de **sanidade dos dados** diretamente no **pgAdmin**:
   - Contagem total de registros.
   - Verificação de nulos e valores inválidos.
   - Faixas de datas (order_date, ship_date, delivery_date...).
   - Estatísticas de distância, peso, frete, custo e atraso.
   - Distribuição por status, veículo e indicador de entrega no prazo.

## 📝 Scripts SQL — Etapa A

As queries desenvolvidas estão disponíveis em [`sql/sanidade.sql`](./sql/sanidade.sql), contendo:

- Contagem de registros.
- Verificação de nulos e vazios.
- Faixa de datas.
- Estatísticas de variáveis numéricas.
- Distribuições e agrupamentos por status, veículos e entregas.

## 🚀 Próximos Passos — Etapa B (Exploração)

- Criação de métricas exploratórias no SQL.
- Início da modelagem dimensional.
- Preparação para integração com ferramentas de análise (ex: Power BI).

## ▶️ Como Executar

1. Configurar o PostgreSQL local e criar o banco `newfase`.
2. Ativar o ambiente virtual e instalar dependências:
   ```bash
   pip install -r requirements.txt
   ```
3. Definir as variáveis de ambiente no arquivo `.env`:
   ```env
   DB_HOST=localhost
   DB_PORT=5432
   DB_NAME=newfase
   DB_USER=postgres
   DB_PASS=sua_senha
   ```
4. Rodar o script de carga:
   ```bash
   python load_data.py
   ```
5. Executar as queries de sanidade:
   ```sql
   \i sql/sanidade.sql
   ```

---

📅 **Última atualização:** 20/08/2025  
✍️ Autor: Vanthuir Maia
📧 Email: vanmaiasf@gmail.com
📧 Email: vanthuir.dev@gmail.com
📞 Telefone: +55 (87) 99607-5897
📞 Telefone: +55 (87) 98153-1743
