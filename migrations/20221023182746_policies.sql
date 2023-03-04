drop policy "Enable delete for users based on creator_uuid" on "public"."comments";

drop policy "Enable update for users based on uuid" on "public"."comments";

drop policy "Enable delete for users based on creator_uuid" on "public"."posts";

drop policy "Enable update for users based on uuid" on "public"."posts";

alter table "public"."comments" alter column "creator_uuid" set default auth.uid();

alter table "public"."comments" alter column "creator_uuid" set not null;

alter table "public"."comments" alter column "post_id" set not null;

alter table "public"."likes" alter column "creator_uuid" set default auth.uid();

alter table "public"."likes" alter column "creator_uuid" set not null;

alter table "public"."likes" alter column "post_id" set not null;

alter table "public"."posts" alter column "creator_uuid" set default auth.uid();

alter table "public"."posts" alter column "creator_uuid" set not null;

create policy "Enable read access for authenticated users"
on "public"."comments"
as permissive
for select
to authenticated
using (true);


create policy "Enable delete for users based on user_uuid"
on "public"."likes"
as permissive
for delete
to authenticated
using ((auth.uid() = creator_uuid));


create policy "Enable insert for authenticated users only"
on "public"."likes"
as permissive
for insert
to authenticated
with check (true);


create policy "Enable read access for all users"
on "public"."likes"
as permissive
for select
to authenticated
using (true);


create policy "Enable read access for all users"
on "public"."users"
as permissive
for select
to public
using (true);


create policy "Enable delete for users based on creator_uuid"
on "public"."comments"
as permissive
for delete
to authenticated
using ((auth.uid() = creator_uuid));


create policy "Enable update for users based on uuid"
on "public"."comments"
as permissive
for update
to authenticated
using ((auth.uid() = creator_uuid))
with check ((auth.uid() = creator_uuid));


create policy "Enable delete for users based on creator_uuid"
on "public"."posts"
as permissive
for delete
to authenticated
using ((auth.uid() = creator_uuid));


create policy "Enable update for users based on uuid"
on "public"."posts"
as permissive
for update
to authenticated
using ((auth.uid() = creator_uuid))
with check ((auth.uid() = creator_uuid));



