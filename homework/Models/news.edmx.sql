
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/06/2017 19:39:06
-- Generated from EDMX file: c:\users\janee\source\repos\homework\homework\Models\news.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DBNews];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'News'
CREATE TABLE [dbo].[News] (
    [Type_id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Administrators'
CREATE TABLE [dbo].[Administrators] (
    [Code] int IDENTITY(1,1) NOT NULL,
    [Password_admin] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Registered_user'
CREATE TABLE [dbo].[Registered_user] (
    [User_id] int IDENTITY(1,1) NOT NULL,
    [Email_id] nvarchar(max)  NOT NULL,
    [Password_user] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Read_by'
CREATE TABLE [dbo].[Read_by] (
    [News_Type_id] int  NOT NULL,
    [Registered_user_User_id] int  NOT NULL
);
GO

-- Creating table 'Managed_by'
CREATE TABLE [dbo].[Managed_by] (
    [News_Type_id] int  NOT NULL,
    [Administrators_Code] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Type_id] in table 'News'
ALTER TABLE [dbo].[News]
ADD CONSTRAINT [PK_News]
    PRIMARY KEY CLUSTERED ([Type_id] ASC);
GO

-- Creating primary key on [Code] in table 'Administrators'
ALTER TABLE [dbo].[Administrators]
ADD CONSTRAINT [PK_Administrators]
    PRIMARY KEY CLUSTERED ([Code] ASC);
GO

-- Creating primary key on [User_id] in table 'Registered_user'
ALTER TABLE [dbo].[Registered_user]
ADD CONSTRAINT [PK_Registered_user]
    PRIMARY KEY CLUSTERED ([User_id] ASC);
GO

-- Creating primary key on [News_Type_id], [Registered_user_User_id] in table 'Read_by'
ALTER TABLE [dbo].[Read_by]
ADD CONSTRAINT [PK_Read_by]
    PRIMARY KEY CLUSTERED ([News_Type_id], [Registered_user_User_id] ASC);
GO

-- Creating primary key on [News_Type_id], [Administrators_Code] in table 'Managed_by'
ALTER TABLE [dbo].[Managed_by]
ADD CONSTRAINT [PK_Managed_by]
    PRIMARY KEY CLUSTERED ([News_Type_id], [Administrators_Code] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [News_Type_id] in table 'Read_by'
ALTER TABLE [dbo].[Read_by]
ADD CONSTRAINT [FK_Read_by_News]
    FOREIGN KEY ([News_Type_id])
    REFERENCES [dbo].[News]
        ([Type_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Registered_user_User_id] in table 'Read_by'
ALTER TABLE [dbo].[Read_by]
ADD CONSTRAINT [FK_Read_by_Registered_user]
    FOREIGN KEY ([Registered_user_User_id])
    REFERENCES [dbo].[Registered_user]
        ([User_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Read_by_Registered_user'
CREATE INDEX [IX_FK_Read_by_Registered_user]
ON [dbo].[Read_by]
    ([Registered_user_User_id]);
GO

-- Creating foreign key on [News_Type_id] in table 'Managed_by'
ALTER TABLE [dbo].[Managed_by]
ADD CONSTRAINT [FK_Managed_by_News]
    FOREIGN KEY ([News_Type_id])
    REFERENCES [dbo].[News]
        ([Type_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Administrators_Code] in table 'Managed_by'
ALTER TABLE [dbo].[Managed_by]
ADD CONSTRAINT [FK_Managed_by_Administrator]
    FOREIGN KEY ([Administrators_Code])
    REFERENCES [dbo].[Administrators]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Managed_by_Administrator'
CREATE INDEX [IX_FK_Managed_by_Administrator]
ON [dbo].[Managed_by]
    ([Administrators_Code]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------