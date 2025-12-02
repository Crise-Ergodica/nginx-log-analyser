# 📊 Nginx Log Analyser

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell Script](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux-orange.svg)](https://www.kernel.org/)

Ferramenta CLI profissional para análise de logs do Nginx com múltiplas soluções (awk, grep, sed) e estatísticas detalhadas. Analisa IPs, caminhos, códigos de status e user agents.

> 🗺️ **Projeto baseado em**: [roadmap.sh - Nginx Log Analyser](https://roadmap.sh/projects/nginx-log-analyser)

## ✨ Características

### 🎯 Funcionalidades Principais
- **Top IPs**: Lista os endereços IP com mais requisições
- **Top Paths**: Caminhos mais solicitados no servidor
- **Top Status Codes**: Códigos de resposta HTTP mais comuns
- **Top User Agents**: Navegadores e clients mais utilizados
- **Range de Datas**: Período coberto pelos logs
- **Total de Requisições**: Contagem completa de entradas

### 🚀 Múltiplos Métodos de Análise
- **AWK** (padrão) - Rápido e eficiente, recomendado
- **GREP** - Usa grep + sed + sort + uniq
- **SED** - Usa sed + sort + uniq

### 🎨 Interface
- Output colorido e formatado
- Headers visuais com emojis
- Alinhamento de colunas
- Modo verbose para debugging

## 💻 Instalação

### Método 1: Clone do Repositório

```bash
# Clone o repositório
git clone https://github.com/Crise-Ergodica/nginx-log-analyser.git
cd nginx-log-analyser

# Torne o script executável
chmod +x nginx-log-analyser

# (Opcional) Instale globalmente
sudo cp nginx-log-analyser /usr/local/bin/
```

### Método 2: Download Direto

```bash
# Download do script
wget https://raw.githubusercontent.com/Crise-Ergodica/nginx-log-analyser/main/nginx-log-analyser

# Torne executável
chmod +x nginx-log-analyser

# (Opcional) Mova para PATH
sudo mv nginx-log-analyser /usr/local/bin/
```

### Obter Log de Exemplo

```bash
# Download do arquivo de log de exemplo do roadmap.sh
wget https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log
```

## 🚀 Uso

### Sintaxe Básica

```bash
nginx-log-analyser [options] <log-file>
```

### Exemplos Práticos

#### 1. Análise Básica (Método AWK)

```bash
./nginx-log-analyser nginx-access.log
```

#### 2. Mostrar Top 10 Resultados

```bash
./nginx-log-analyser --top 10 nginx-access.log
```

#### 3. Usar Método GREP

```bash
./nginx-log-analyser --method grep nginx-access.log
```

#### 4. Usar Método SED

```bash
./nginx-log-analyser --method sed nginx-access.log
```

#### 5. Mostrar Range de Datas

```bash
./nginx-log-analyser --dates nginx-access.log
```

#### 6. Modo Verbose

```bash
./nginx-log-analyser --verbose nginx-access.log
```

#### 7. Combinação de Opções

```bash
./nginx-log-analyser --top 10 --method grep --dates --verbose nginx-access.log
```

## 📊 Exemplo de Output

```
═══════════════════════════════════════════════════════
           Nginx Log Analyser v1.0.0
═══════════════════════════════════════════════════════

Analyzing: nginx-access.log
Method: awk
Showing top 5 results
Total requests: 5000

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Top 5 IP addresses with the most requests
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

45.76.135.253        - 1000 requests
142.93.143.8         - 600 requests
178.128.94.113       - 450 requests
43.224.43.187        - 350 requests
172.65.251.78        - 250 requests

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Top 5 most requested paths
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

/api/v1/users                                      - 1000 requests
/api/v1/products                                   - 600 requests
/api/v1/orders                                     - 450 requests
/api/v1/payments                                   - 350 requests
/api/v1/reviews                                    - 250 requests

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Top 5 response status codes
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

200        - 2500 requests
404        - 1200 requests
500        - 800 requests
304        - 300 requests
401        - 200 requests

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Top 5 user agents
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36              - 1500 requests
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36       - 1200 requests
Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36                        - 800 requests
Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)                    - 600 requests
Python-requests/2.28.1                                                     - 400 requests

═══════════════════════════════════════════════════════
Analysis completed successfully!
═══════════════════════════════════════════════════════
```

## 🛠️ Opções

| Opção | Descrição |
|--------|-------------|
| `-n, --top N` | Mostra top N resultados (padrão: 5) |
| `-m, --method TYPE` | Método de análise: awk, grep, sed (padrão: awk) |
| `-d, --dates` | Mostra período dos logs |
| `-v, --verbose` | Habilita output detalhado |
| `-h, --help` | Exibe mensagem de ajuda |
| `--version` | Exibe versão |

## 🔧 Requisitos

- **Sistema Operacional**: Linux/Unix/MacOS
- **Shell**: Bash 4.0+
- **Ferramentas**: `awk`, `grep`, `sed`, `sort`, `uniq`, `head`, `tail`, `wc`

### Verificação de Dependências

```bash
# Verificar se todas as ferramentas estão disponíveis
for cmd in awk grep sed sort uniq head tail wc; do
    command -v $cmd >/dev/null 2>&1 || echo "$cmd não encontrado"
done
```

## 🔍 Detalhes dos Métodos

### Método AWK (Recomendado)

**Vantagens:**
- Mais rápido para grandes arquivos
- Sintaxe limpa e legível
- Processamento eficiente de campos
- Menos comandos encadeados

**Exemplo de uso interno:**
```bash
awk '{print $1}' log.txt | sort | uniq -c | sort -rn | head -n 5
```

### Método GREP

**Vantagens:**
- Expressões regulares poderosas
- Filtros complexos
- Bom para padrões específicos

**Exemplo de uso interno:**
```bash
grep -oE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' log.txt | sort | uniq -c | sort -rn
```

### Método SED

**Vantagens:**
- Substituições complexas
- Transformações de texto
- Edição em stream

**Exemplo de uso interno:**
```bash
sed -n 's/^\([0-9.]\+\).*/\1/p' log.txt | sort | uniq -c | sort -rn
```

## 📊 Formato do Log Nginx

O script espera logs no formato padrão do Nginx:

```
IP - - [Data] "MÉTODO /caminho HTTP/1.1" STATUS TAMANHO "Referrer" "User-Agent"
```

**Exemplo:**
```
192.168.1.1 - - [01/Dec/2025:10:30:45 +0000] "GET /api/users HTTP/1.1" 200 1234 "-" "Mozilla/5.0"
```

### Campos Extraídos

1. **Campo 1** ($1): Endereço IP
2. **Campo 7** ($7): Caminho da requisição
3. **Campo 9** ($9): Código de status HTTP
4. **Último campo entre aspas**: User agent

## 🐛 Troubleshooting

### Erro: "Log file is empty"

**Causa**: Arquivo de log vazio ou não existe

**Solução**:
```bash
# Verificar se arquivo existe e tem conteúdo
ls -lh nginx-access.log
head -n 5 nginx-access.log
```

### Erro: "Permission denied"

**Causa**: Sem permissão de leitura

**Solução**:
```bash
# Dar permissão de leitura
chmod +r nginx-access.log

# Ou usar sudo
sudo ./nginx-log-analyser /var/log/nginx/access.log
```

### Resultados Inesperados

**Causa**: Formato de log diferente do padrão

**Solução**: Use `--verbose` para ver o processamento:
```bash
./nginx-log-analyser --verbose nginx-access.log
```

## 🎓 Aprendizado

Este projeto ensina:
- Processamento de texto com `awk`, `grep`, e `sed`
- Pipelines e encadeamento de comandos Unix
- Expressões regulares práticas
- Análise de logs e estatísticas
- Ordenação e contagem com `sort` e `uniq`
- Extracão de campos de arquivos estruturados
- Múltiplas soluções para o mesmo problema

## 🚀 Casos de Uso

### 1. Monitoramento de Tráfego
```bash
# Análise diária
./nginx-log-analyser /var/log/nginx/access.log > daily-report.txt
```

### 2. Detecção de Abusos
```bash
# Top 20 IPs
./nginx-log-analyser --top 20 /var/log/nginx/access.log
```

### 3. Análise de Erros
```bash
# Filtrar apenas erros 5xx
grep '" 5[0-9][0-9] ' /var/log/nginx/access.log | ./nginx-log-analyser -
```

### 4. Relatórios Automáticos
```bash
# Cron job diário
0 0 * * * /usr/local/bin/nginx-log-analyser /var/log/nginx/access.log.1 > /var/reports/$(date +\%Y-\%m-\%d).txt
```

## 📝 Licença

MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 👤 Autor

**Aurora Ergodica**
- GitHub: [@Crise-Ergodica](https://github.com/Crise-Ergodica)
- Email: gdcm10@gmail.com

## 🔗 Links Úteis

- [Nginx Log Format Documentation](https://nginx.org/en/docs/http/ngx_http_log_module.html)
- [AWK Tutorial](https://www.gnu.org/software/gawk/manual/)
- [Grep Manual](https://www.gnu.org/software/grep/manual/)
- [Sed Manual](https://www.gnu.org/software/sed/manual/)
- [roadmap.sh Project](https://roadmap.sh/projects/nginx-log-analyser)

---

<div align="center">

*"God's in His heaven, all's right with the world!"*

Feito com ❤️ por [Aurora Ergodica](https://github.com/Crise-Ergodica)

</div>
