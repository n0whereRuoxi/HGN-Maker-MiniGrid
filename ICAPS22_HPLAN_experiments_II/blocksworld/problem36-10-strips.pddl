( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b567 - block
    b327 - block
    b394 - block
    b215 - block
    b74 - block
    b313 - block
    b989 - block
    b912 - block
    b383 - block
    b864 - block
    b821 - block
    b197 - block
    b630 - block
    b465 - block
    b735 - block
    b878 - block
    b42 - block
    b941 - block
    b756 - block
    b967 - block
    b125 - block
    b268 - block
    b192 - block
    b509 - block
    b87 - block
    b37 - block
    b400 - block
    b603 - block
    b241 - block
    b909 - block
    b164 - block
    b696 - block
    b534 - block
    b235 - block
    b308 - block
    b88 - block
    b169 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b567 )
    ( on b327 b567 )
    ( on b394 b327 )
    ( on b215 b394 )
    ( on b74 b215 )
    ( on b313 b74 )
    ( on b989 b313 )
    ( on b912 b989 )
    ( on b383 b912 )
    ( on b864 b383 )
    ( on b821 b864 )
    ( on b197 b821 )
    ( on b630 b197 )
    ( on b465 b630 )
    ( on b735 b465 )
    ( on b878 b735 )
    ( on b42 b878 )
    ( on b941 b42 )
    ( on b756 b941 )
    ( on b967 b756 )
    ( on b125 b967 )
    ( on b268 b125 )
    ( on b192 b268 )
    ( on b509 b192 )
    ( on b87 b509 )
    ( on b37 b87 )
    ( on b400 b37 )
    ( on b603 b400 )
    ( on b241 b603 )
    ( on b909 b241 )
    ( on b164 b909 )
    ( on b696 b164 )
    ( on b534 b696 )
    ( on b235 b534 )
    ( on b308 b235 )
    ( on b88 b308 )
    ( on b169 b88 )
    ( clear b169 )
  )
  ( :goal
    ( and
      ( clear b567 )
    )
  )
)
