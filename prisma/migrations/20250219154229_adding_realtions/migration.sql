/*
  Warnings:

  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `username` on the `User` table. All the data in the column will be lost.
  - Added the required column `user_Id` to the `Form` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "User_email_key";

-- DropIndex
DROP INDEX "User_username_key";

-- AlterTable
ALTER TABLE "Form" ADD COLUMN     "user_Id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "email",
DROP COLUMN "firstName",
DROP COLUMN "lastName",
DROP COLUMN "password",
DROP COLUMN "username",
ADD COLUMN     "name" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Form" ADD CONSTRAINT "Form_user_Id_fkey" FOREIGN KEY ("user_Id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
