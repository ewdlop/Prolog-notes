% Facts about LLM models
llm(gpt4).
llm(claude).
llm(llama2).
llm(palm).
llm(mistral).
llm(gemini).
llm(gpt3_5).
llm(claude_opus).
llm(claude_sonnet).
llm(claude_haiku).

% Model families
model_family(openai, gpt4).
model_family(openai, gpt3_5).
model_family(anthropic, claude).
model_family(anthropic, claude_opus).
model_family(anthropic, claude_sonnet).
model_family(anthropic, claude_haiku).
model_family(meta, llama2).
model_family(google, palm).
model_family(google, gemini).
model_family(mistral_ai, mistral).

% Release dates (year, month)
released(gpt4, 2023, 3).
released(claude, 2022, 12).
released(llama2, 2023, 7).
released(palm, 2023, 3).
released(mistral, 2023, 9).
released(gemini, 2023, 12).
released(gpt3_5, 2022, 11).
released(claude_opus, 2024, 3).
released(claude_sonnet, 2024, 3).
released(claude_haiku, 2024, 3).

% Model sizes (in parameters, billions)
parameters(gpt4, 1500).
parameters(claude, 800).
parameters(llama2, 70).
parameters(palm, 540).
parameters(mistral, 7).
parameters(gemini, 1000).
parameters(gpt3_5, 175).
parameters(claude_opus, 1000).
parameters(claude_sonnet, 350).
parameters(claude_haiku, 70).

% Context window sizes (in tokens)
context_window(gpt4, 32000).
context_window(claude, 100000).
context_window(llama2, 4096).
context_window(palm, 8192).
context_window(mistral, 8192).
context_window(gemini, 32000).
context_window(gpt3_5, 16000).
context_window(claude_opus, 200000).
context_window(claude_sonnet, 180000).
context_window(claude_haiku, 150000).

% Capabilities
capability(text_generation).
capability(code_generation).
capability(reasoning).
capability(math).
capability(image_understanding).
capability(multilingual).
capability(few_shot_learning).
capability(tool_use).
capability(rag).

% Model capabilities
has_capability(gpt4, text_generation).
has_capability(gpt4, code_generation).
has_capability(gpt4, reasoning).
has_capability(gpt4, math).
has_capability(gpt4, image_understanding).
has_capability(gpt4, multilingual).
has_capability(gpt4, few_shot_learning).
has_capability(gpt4, tool_use).
has_capability(gpt4, rag).

has_capability(claude, text_generation).
has_capability(claude, code_generation).
has_capability(claude, reasoning).
has_capability(claude, math).
has_capability(claude, image_understanding).
has_capability(claude, multilingual).
has_capability(claude, few_shot_learning).
has_capability(claude, tool_use).
has_capability(claude, rag).

% Add similar capability facts for other models...

% Relationships and rules
newer_than(Model1, Model2) :- 
    released(Model1, Year1, Month1),
    released(Model2, Year2, Month2),
    (Year1 > Year2 ; (Year1 = Year2, Month1 > Month2)).

larger_than(Model1, Model2) :-
    parameters(Model1, Params1),
    parameters(Model2, Params2),
    Params1 > Params2.

bigger_context(Model1, Model2) :-
    context_window(Model1, Context1),
    context_window(Model2, Context2),
    Context1 > Context2.

same_company(Model1, Model2) :-
    model_family(Company, Model1),
    model_family(Company, Model2),
    Model1 \= Model2.

successor(NewerModel, OlderModel) :-
    same_company(NewerModel, OlderModel),
    newer_than(NewerModel, OlderModel).

competitor(Model1, Model2) :-
    llm(Model1),
    llm(Model2),
    model_family(Company1, Model1),
    model_family(Company2, Model2),
    Company1 \= Company2.

% Benchmark scores (hypothetical, on scale 0-100)
benchmark_score(gpt4, reasoning, 92).
benchmark_score(claude, reasoning, 91).
benchmark_score(llama2, reasoning, 78).
benchmark_score(gpt4, coding, 95).
benchmark_score(claude, coding, 94).
benchmark_score(llama2, coding, 81).
% Add more benchmark scores...

outperforms(Model1, Model2, Task) :-
    benchmark_score(Model1, Task, Score1),
    benchmark_score(Model2, Task, Score2),
    Score1 > Score2.

% API availability
api_available(gpt4).
api_available(claude).
api_available(llama2).
api_available(gpt3_5).
api_available(claude_opus).
api_available(claude_sonnet).
api_available(claude_haiku).

% Fine-tuning support
supports_fine_tuning(gpt4).
supports_fine_tuning(llama2).
supports_fine_tuning(gpt3_5).
supports_fine_tuning(mistral).

% Deployment options
deployment_option(cloud).
deployment_option(local).
deployment_option(hybrid).

can_deploy(gpt4, cloud).
can_deploy(claude, cloud).
can_deploy(llama2, cloud).
can_deploy(llama2, local).
can_deploy(llama2, hybrid).
can_deploy(mistral, local).
can_deploy(mistral, cloud).
% Add more deployment options...

% Cost categories (low, medium, high)
cost_category(gpt4, high).
cost_category(claude, high).
cost_category(llama2, low).
cost_category(gpt3_5, medium).
cost_category(mistral, low).
cost_category(claude_opus, high).
cost_category(claude_sonnet, medium).
cost_category(claude_haiku, low).

more_affordable(Model1, Model2) :-
    cost_category(Model1, Cat1),
    cost_category(Model2, Cat2),
    cost_ordering(Cat1, Cat2).

cost_ordering(low, medium).
cost_ordering(low, high).
cost_ordering(medium, high).

% Usability for specific applications
suitable_for(Model, Application) :-
    required_capabilities(Application, ReqCapabilities),
    has_all_capabilities(Model, ReqCapabilities).

has_all_capabilities(_, []).
has_all_capabilities(Model, [Cap|Caps]) :-
    has_capability(Model, Cap),
    has_all_capabilities(Model, Caps).

required_capabilities(chatbot, [text_generation, reasoning]).
required_capabilities(code_assistant, [code_generation, reasoning]).
required_capabilities(multimodal_app, [text_generation, image_understanding]).
