// Learn more about clients at https://docs.boundaryml.com/docs/snippets/clients/overview

client<llm> GPT4o {
  provider openai
  options {
    model "gpt-4o"
    api_key env.OPENAI_API_KEY
  }
}

client<llm> O1 {
  provider openai
  options {
    model "o1-preview"
    api_key env.OPENAI_API_KEY
  }
}

client<llm> DeepseekR1 {
  provider openai-generic
  options {
    model "deepseek/deepseek-r1"
    base_url "https://openrouter.ai/api/v1"
    api_key env.OPENROUTER_API_KEY
  }
}