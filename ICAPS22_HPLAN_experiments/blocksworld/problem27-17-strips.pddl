( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b644 - block
    b219 - block
    b117 - block
    b788 - block
    b64 - block
    b9 - block
    b171 - block
    b892 - block
    b121 - block
    b814 - block
    b546 - block
    b749 - block
    b71 - block
    b532 - block
    b372 - block
    b225 - block
    b384 - block
    b496 - block
    b938 - block
    b745 - block
    b239 - block
    b602 - block
    b360 - block
    b493 - block
    b617 - block
    b302 - block
    b182 - block
    b369 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b644 )
    ( on b219 b644 )
    ( on b117 b219 )
    ( on b788 b117 )
    ( on b64 b788 )
    ( on b9 b64 )
    ( on b171 b9 )
    ( on b892 b171 )
    ( on b121 b892 )
    ( on b814 b121 )
    ( on b546 b814 )
    ( on b749 b546 )
    ( on b71 b749 )
    ( on b532 b71 )
    ( on b372 b532 )
    ( on b225 b372 )
    ( on b384 b225 )
    ( on b496 b384 )
    ( on b938 b496 )
    ( on b745 b938 )
    ( on b239 b745 )
    ( on b602 b239 )
    ( on b360 b602 )
    ( on b493 b360 )
    ( on b617 b493 )
    ( on b302 b617 )
    ( on b182 b302 )
    ( on b369 b182 )
    ( clear b369 )
  )
  ( :goal
    ( and
      ( clear b644 )
    )
  )
)
