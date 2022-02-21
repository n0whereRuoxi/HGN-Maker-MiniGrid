( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b400 - block
    b864 - block
    b21 - block
    b715 - block
    b507 - block
    b186 - block
    b151 - block
    b89 - block
    b912 - block
    b692 - block
    b181 - block
    b80 - block
    b895 - block
    b943 - block
    b633 - block
    b203 - block
    b625 - block
    b713 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b400 )
    ( on b864 b400 )
    ( on b21 b864 )
    ( on b715 b21 )
    ( on b507 b715 )
    ( on b186 b507 )
    ( on b151 b186 )
    ( on b89 b151 )
    ( on b912 b89 )
    ( on b692 b912 )
    ( on b181 b692 )
    ( on b80 b181 )
    ( on b895 b80 )
    ( on b943 b895 )
    ( on b633 b943 )
    ( on b203 b633 )
    ( on b625 b203 )
    ( on b713 b625 )
    ( clear b713 )
  )
  ( :goal
    ( and
      ( clear b400 )
    )
  )
)
