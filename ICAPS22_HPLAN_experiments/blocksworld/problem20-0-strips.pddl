( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b203 - block
    b415 - block
    b696 - block
    b137 - block
    b614 - block
    b465 - block
    b743 - block
    b616 - block
    b225 - block
    b773 - block
    b747 - block
    b46 - block
    b692 - block
    b860 - block
    b738 - block
    b334 - block
    b623 - block
    b493 - block
    b185 - block
    b193 - block
    b908 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b203 )
    ( on b415 b203 )
    ( on b696 b415 )
    ( on b137 b696 )
    ( on b614 b137 )
    ( on b465 b614 )
    ( on b743 b465 )
    ( on b616 b743 )
    ( on b225 b616 )
    ( on b773 b225 )
    ( on b747 b773 )
    ( on b46 b747 )
    ( on b692 b46 )
    ( on b860 b692 )
    ( on b738 b860 )
    ( on b334 b738 )
    ( on b623 b334 )
    ( on b493 b623 )
    ( on b185 b493 )
    ( on b193 b185 )
    ( on b908 b193 )
    ( clear b908 )
  )
  ( :goal
    ( and
      ( clear b203 )
    )
  )
)
