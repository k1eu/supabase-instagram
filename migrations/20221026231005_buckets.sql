insert into storage.buckets (id, name)
  values ('images', 'images');

UPDATE storage.buckets
  SET public = true
  WHERE id = 'images';

create policy "Public Access"
on storage.objects for select
using ( bucket_id = 'images' );


create policy "Enable insert for authenticated users only"
on "storage"."buckets"
as permissive
for insert
to authenticated
with check (true);

CREATE POLICY "Give users authenticated access to folder 1ffg0oo_0" 
ON storage.objects 
FOR INSERT 
TO public 
WITH CHECK (bucket_id = 'images' AND auth.role() = 'authenticated');
