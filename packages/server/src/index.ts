import { fastifyTRPCPlugin } from "@trpc/server/adapters/fastify";
import cors from "@fastify/cors";
import fastify from "fastify";

import { serverPort } from "@/config";
import { createContext } from "@/context";
import { appRouter } from "@/router";

const bootstrap = async () => {
  const app = fastify({ logger: false });

  await app.register(cors, {
    origin: "*",
  });

  app.get("/", () => ({ message: "hello world" }));

  await app.register(fastifyTRPCPlugin, {
    prefix: "/trpc",
    trpcOptions: { router: appRouter, createContext },
  });

  if (import.meta.env.PROD) {
    return await app
      .listen({ port: serverPort })
      .then(() => app.server.address())
      .then((address) => (typeof address === "string" ? address : address?.port))
      .then((address) => console.info(`listening on: ${address}`))
      .catch((err) => {
        console.error("error starting server:", err);
        process.exit(1);
      });
  }

  return await Promise.resolve(app);
};

export const viteNodeApp = bootstrap();
