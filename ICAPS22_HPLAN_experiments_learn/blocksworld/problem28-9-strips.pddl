( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b36 - block
    b123 - block
    b991 - block
    b865 - block
    b173 - block
    b750 - block
    b676 - block
    b230 - block
    b404 - block
    b546 - block
    b15 - block
    b517 - block
    b110 - block
    b792 - block
    b400 - block
    b31 - block
    b247 - block
    b369 - block
    b66 - block
    b977 - block
    b869 - block
    b468 - block
    b356 - block
    b852 - block
    b75 - block
    b542 - block
    b198 - block
    b134 - block
    b138 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b36 )
    ( on b123 b36 )
    ( on b991 b123 )
    ( on b865 b991 )
    ( on b173 b865 )
    ( on b750 b173 )
    ( on b676 b750 )
    ( on b230 b676 )
    ( on b404 b230 )
    ( on b546 b404 )
    ( on b15 b546 )
    ( on b517 b15 )
    ( on b110 b517 )
    ( on b792 b110 )
    ( on b400 b792 )
    ( on b31 b400 )
    ( on b247 b31 )
    ( on b369 b247 )
    ( on b66 b369 )
    ( on b977 b66 )
    ( on b869 b977 )
    ( on b468 b869 )
    ( on b356 b468 )
    ( on b852 b356 )
    ( on b75 b852 )
    ( on b542 b75 )
    ( on b198 b542 )
    ( on b134 b198 )
    ( on b138 b134 )
    ( clear b138 )
  )
  ( :goal
    ( and
      ( clear b36 )
    )
  )
)
