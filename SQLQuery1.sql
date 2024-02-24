
--drop table [dbo].[Sizes]
--drop table [dbo].[Colors]
--drop table [dbo].[Brands]
--drop table [dbo].[Products]
--drop table [dbo].[ProductImages]
--drop table [dbo].[Specifications]
--drop table [dbo].[SpecificationValues]
--drop table [dbo].[Categories]
--drop table [dbo].[BlogPosts]
create table [dbo].[Sizes](
  [Id] int primary key identity(1,1), 
  [Name] nvarchar(100) not null,
  [SmallName] varchar(10) not null,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime default getdate(),
  [LastModifiedBy] int,
  [DeletedAt] datetime default getdate(),
  [DeletedBy] int
)
--drop table [dbo].[Sizes]


create table [dbo].[Colors](
  [Id] int identity(1,1), 
  [Name] nvarchar(100) not null,
  [HexCode] varchar(9),
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime default getdate(),
  [LastModifiedBy] int,
  [DeletedAt] datetime default getdate(),
  [DeletedBy] int
)
--drop table [dbo].[Colors]
alter table [dbo].[Colors]
add constraint PK_Colors primary key(Id)
alter table [dbo].[Colors]
add constraint DF_Colors_GetDate default getdate() for CreatedAt

create table [dbo].[Brands](
  [Id] int primary key identity(1,1), 
  [Name] nvarchar(100) not null,
  [CreatedAt] datetime not null default getdate(),
  [CreatedBy] int not null,
  [LastModifiedAt] datetime default getdate(),
  [LastModifiedBy] int,
  [DeletedAt] datetime default getdate(),
  [DeletedBy] int
)
--drop table [dbo].[Colors]
--drop table  [dbo].[Brands]

create table [dbo].[Products](
   [Id] int primary key identity(1,1),
   [Name] nvarchar(200) not null,
   [Slug] varchar(200) not null,
   [StockKeepingUnit] nvarchar,
   [ShortDescrripton] nvarchar,
   [Description] nvarchar,
   [Rate] decimal not null,
   [CategoryId] int,
   [BrandId] int not null,
   [CreatedAt] datetime not null default getdate(),
   [CreatedBy] int not null,
   [LastModifiedAt] datetime default getdate(),
   [LastModifiedBy] int,
   [DeletedAt] datetime default getdate(),
   [DeletedBy] int
)
--drop table [dbo].[Products]
alter table [dbo].[Products]
add constraint FK_Products_Brands foreign key([BrandId]) references [dbo].[Brands]([Id])
alter table [dbo].[Products]
add constraint FK_Products_CategoryId foreign key([CategoryId]) references [dbo].[Categories]([Id])

--drop table [dbo].[Products]

create table [dbo].[SpecificationValues](
[SpecificationId] int primary key identity(1,1),
[ProductId] int not null,
[Value] nvarchar not null,
)
alter table [dbo].[SpecificationValues]
add constraint FK_SpecificationValues_ProductId foreign key([ProductId]) references [dbo].[Products]([Id])
alter table [dbo].[SpecificationValues]
add constraint  FK_SpecificationValues_SpecificationId foreign key([SpecificationId]) references [dbo].[Specifications]([Id])

create table [dbo].[ProductImages](
[Id] int primary key identity(1,1),
[Name] nvarchar(100) not null,
[ProductId] int not null,
[IsMain] bit,
)

alter table [dbo].[ProductImages]
add constraint FK_ProductImages_ProductId foreign key([ProductId]) references [dbo].[Products]([Id])


create table [dbo].[Categories](
[Id] int primary key identity(1,1),
[ParentId] int not null,
[Name] nvarchar(100) not null,
[CreatedAt] datetime not null,
[CreatedBy] int not null,
[LastModifiedAt] datetime,
[LastModifiedBy] int,
[DeletedAt] datetime,
[DeletedBy] int
)
alter table [dbo].[Categories]
add constraint FK_Categories_Id foreign key([ParentId]) references [dbo].[Categories]([Id])


create table [dbo].[Specifications](
[Id] int primary key identity(1,1),
[Name] nvarchar(100) not null,
[CreatedAt] datetime not null default getdate(),
[CreatedBy] int not null,
[LastModifiedAt] datetime default getdate(),
[LastModifiedBy] int,
[DeletedAt] datetime default getdate(),
[DeletedBy] int
)
--drop table [dbo].[Specifications]

create table [dbo].[BlogPosts](
[Id] int primary key identity(1,1),
[Title] nvarchar not null,
[Slug] nvarchar not null,
[Body] nvarchar not null,
[ImagePath] nvarchar,
[CategoryId] int not null,
[PublishedBy] int not null,
[PublishedAt] datetime default getdate(),
[CreatedAt] datetime not null default getdate(),
[CreatedBy] int not null,
[LastModifiedAt] datetime default getdate(),
[LastModifiedBy] int,
[DeletedAt] datetime default getdate(),
[DeletedBy] int,
)
--drop table [dbo].[BlogPosts]
alter table [dbo].[BlogPosts]
add constraint FK_BlogPosts_CategoryId foreign key([CategoryId]) references [dbo].[Categories]([Id])

