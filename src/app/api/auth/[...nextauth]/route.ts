import NextAuth from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
const handler = NextAuth({
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        username: {
          label: "email",
          type: "text",
          placeholder: "Enter Your Email",
        },
        password: { label: "password", type: "password", placeholder: "" },
      },
      async authorize(credentials: any) {
        const username = credentials?.username;
        const password = credentials?.password;
        const response = await prisma.user.findFirst({
          where: {
            username: username,
            password: password,
          },
        });
        if (response) {
          return response;
        } else return null;
      },
    }),
  ],
  secret: process.env.NEXTAUTH_SECRET,
});

export { handler as GET, handler as POST };
