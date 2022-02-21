( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b395 - block
    b812 - block
    b292 - block
    b770 - block
    b473 - block
    b776 - block
    b790 - block
    b697 - block
    b905 - block
    b822 - block
    b667 - block
    b460 - block
    b765 - block
    b426 - block
    b563 - block
    b539 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b395 )
    ( on b812 b395 )
    ( on b292 b812 )
    ( on b770 b292 )
    ( on b473 b770 )
    ( on b776 b473 )
    ( on b790 b776 )
    ( on b697 b790 )
    ( on b905 b697 )
    ( on b822 b905 )
    ( on b667 b822 )
    ( on b460 b667 )
    ( on b765 b460 )
    ( on b426 b765 )
    ( on b563 b426 )
    ( on b539 b563 )
    ( clear b539 )
  )
  ( :goal
    ( and
      ( clear b395 )
    )
  )
)
