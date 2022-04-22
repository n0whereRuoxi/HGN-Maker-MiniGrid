( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b216 - block
    b280 - block
    b240 - block
    b303 - block
    b927 - block
    b899 - block
    b385 - block
    b631 - block
    b433 - block
    b37 - block
    b930 - block
    b673 - block
    b367 - block
    b152 - block
    b39 - block
    b180 - block
    b533 - block
    b611 - block
    b215 - block
    b467 - block
    b369 - block
    b279 - block
    b116 - block
    b936 - block
    b207 - block
    b394 - block
    b764 - block
    b61 - block
    b624 - block
    b672 - block
    b406 - block
    b301 - block
    b196 - block
    b498 - block
    b880 - block
    b907 - block
    b647 - block
    b76 - block
    b985 - block
    b818 - block
    b73 - block
    b261 - block
    b949 - block
    b670 - block
    b560 - block
    b614 - block
    b57 - block
    b172 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b216 )
    ( on b280 b216 )
    ( on b240 b280 )
    ( on b303 b240 )
    ( on b927 b303 )
    ( on b899 b927 )
    ( on b385 b899 )
    ( on b631 b385 )
    ( on b433 b631 )
    ( on b37 b433 )
    ( on b930 b37 )
    ( on b673 b930 )
    ( on b367 b673 )
    ( on b152 b367 )
    ( on b39 b152 )
    ( on b180 b39 )
    ( on b533 b180 )
    ( on b611 b533 )
    ( on b215 b611 )
    ( on b467 b215 )
    ( on b369 b467 )
    ( on b279 b369 )
    ( on b116 b279 )
    ( on b936 b116 )
    ( on b207 b936 )
    ( on b394 b207 )
    ( on b764 b394 )
    ( on b61 b764 )
    ( on b624 b61 )
    ( on b672 b624 )
    ( on b406 b672 )
    ( on b301 b406 )
    ( on b196 b301 )
    ( on b498 b196 )
    ( on b880 b498 )
    ( on b907 b880 )
    ( on b647 b907 )
    ( on b76 b647 )
    ( on b985 b76 )
    ( on b818 b985 )
    ( on b73 b818 )
    ( on b261 b73 )
    ( on b949 b261 )
    ( on b670 b949 )
    ( on b560 b670 )
    ( on b614 b560 )
    ( on b57 b614 )
    ( on b172 b57 )
    ( clear b172 )
  )
  ( :goal
    ( and
      ( clear b216 )
    )
  )
)
