# AI-Enabled Q&A Service

This project provides a foundational setup for an AI-enabled Question & Answer service. It is inspired by the search-first architecture highlighted in [javiramos1/qagent](https://github.com/javiramos1/qagent), prioritizing direct search and LLM context over traditional RAG for many use cases.

The goal is to create a system that can answer questions based on a defined set of knowledge sources, using a combination of web search, content scraping (when necessary), and Large Language Models for response generation.

## 🚀 Quick Start

### 1. Configure Knowledge Sources

Your agent's knowledge is defined by the websites it can search. Edit the \`sites_data.csv\` file to specify these sources.

**CSV Structure:**
- **domain**: The subject area or topic (e.g., "AI Agents", "Python Programming").
- **site**: The website domain to search (e.g., "docs.langchain.com", "python.org").
- **description**: A clear explanation of the site's content. This helps the agent decide if a site is relevant to a user's query.

Example \`sites_data.csv\`:
\`\`\`csv
domain,site,description
AI Agent Frameworks,github.com/openai/swarm,OpenAI Swarm documentation for lightweight multi-agent orchestration
AI Operations,docs.agentops.ai,AgentOps documentation for testing debugging and deploying AI agents and LLM apps
Python Docs,docs.python.org,Official Python documentation
\`\`\`

### 2. Set Up API Keys

This project requires API keys for a search provider (e.g., Tavily) and an LLM provider (e.g., Google Gemini).

1.  **Copy the example environment file:**
    \`\`\`bash
    cp .env.example .env
    \`\`\`
2.  **Edit the \`.env\` file** with your actual API keys:
    \`\`\`bash
    TAVILY_API_KEY="your_tavily_key_here"
    GOOGLE_API_KEY="your_google_key_here"
    \`\`\`
    *Security Note: Keep your \`.env\` file private and never commit it to version control.*

### 3. Install Dependencies

This project uses a \`Makefile\` to simplify setup and common tasks. To install dependencies into a virtual environment:

\`\`\`bash
make install
\`\`\`
This command will:
- Create a Python virtual environment named \`venv\`.
- Activate it (for the scope of the command).
- Install the required packages from \`requirements.txt\`.

After running, you might need to activate the virtual environment in your shell session:
\`\`\`bash
source venv/bin/activate
\`\`\`

### 4. Run the Application

To start the FastAPI development server:

\`\`\`bash
make run
\`\`\`
This will typically start the server on \`http://localhost:8000\`. You can then interact with the API endpoints (e.g., using tools like \`curl\` or Postman).

## 🔧 Configuration

### Required Environment Variables (\`.env\` file)

- \`TAVILY_API_KEY\`: Your API key for the Tavily search service.
- \`GOOGLE_API_KEY\`: Your API key for Google AI Studio (for Gemini models).

### Optional Environment Variables

The \`.env.example\` file lists several optional environment variables that can be used to configure aspects like search depth, LLM temperature, timeouts, etc. These will be integrated into the agent's logic as it's developed.

## 🏗️ Project Structure

\`\`\`
.
├── main.py                 # FastAPI application entry point
├── qa_agent.py             # Core Q&A agent implementation
├── search_tool.py          # Search API integration (e.g., Tavily)
├── scraping_tool.py        # Web scraping tool implementation
├── sites_data.csv          # Knowledge source configuration
├── requirements.txt        # Python dependencies
├── Makefile                # Development and task automation commands
├── .env.example            # Template for environment variables
├── .env                    # Local environment variables (gitignored)
├── README.md               # This file
└── venv/                   # Python virtual environment (gitignored)
\`\`\`

### Key Components (Initial Placeholders)

-   **`main.py`**: Hosts the FastAPI application, defining API endpoints like `/chat`, `/reset`, and `/health`.
-   **`qa_agent.py`**: Will contain the \`QAAgent\` class, orchestrating the query handling, tool usage (search, scrape), and LLM interaction.
-   **`search_tool.py`**: Will implement functions to interact with the chosen search API.
-   **`scraping_tool.py`**: Will implement functions to fetch and parse content from web pages.
-   **`sites_data.csv`**: Defines the scope of websites the agent can access.

## 🛠️ Development

The \`Makefile\` provides several commands to help with development:

-   \`make install\`: Sets up the environment and installs dependencies.
-   \`make run\`: Runs the FastAPI application.
-   \`make clean\`: Removes the virtual environment and cache files.
-   (Other commands like \`test\`, \`lint\`, \`format\`, \`docker-build\`, \`docker-run\` are placeholders and can be implemented as the project grows.)

## 넥스트 단계 (Next Steps)

This project provides a skeleton. Future development will involve:
- Implementing the detailed logic within \`qa_agent.py\`, \`search_tool.py\`, and \`scraping_tool.py\`.
- Integrating the LLM for understanding queries and generating responses.
- Adding robust error handling and logging.
- Developing conversation memory management.
- Writing unit and integration tests.
- Potentially adding Docker support for containerization.
