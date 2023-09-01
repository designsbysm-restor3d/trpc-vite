import { PrismaClient } from "@prisma/client";
import { initTRPC } from "@trpc/server";
import { z } from "zod";

const prisma = new PrismaClient();
export const t = initTRPC.create();

export const appRouter = t.router({
  createShipper: t.procedure
    .input(
      z.object({
        // id: z.number(),
        company_name: z.string().max(40),
        phone: z.string().max(24),
      })
    )
    .mutation((opts) =>
      prisma.shippers.create({
        data: {
          ...opts.input,
        },
      })
    ),

  getShippers: t.procedure.query(() => prisma.shippers.findMany()),

  getShipperById: t.procedure.input(z.number()).query((opts) =>
    prisma.shippers.findUnique({
      where: {
        id: opts.input,
      },
    })
  ),
});

export type AppRouter = typeof appRouter;
