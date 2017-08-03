# Set the Docker image you want to base your image off.
# I chose this one because it has Elixir preinstalled.
FROM nikolauska/phoenix:latest

RUN mkdir /app
WORKDIR /app

# Install Elixir Deps
ADD mix.* ./
RUN mix local.hex --force
RUN mix local.rebar
RUN mix deps.get
RUN mix compile

# Install app
ADD assets /app/assets
ADD priv /app/priv
ADD config /app/config

add entrypoint.sh /app
CMD [ "/app/entrypoint.sh" ]
ADD lib /app/lib
RUN mix compile
