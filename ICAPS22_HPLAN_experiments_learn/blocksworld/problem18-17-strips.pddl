( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b597 - block
    b783 - block
    b601 - block
    b369 - block
    b210 - block
    b225 - block
    b125 - block
    b454 - block
    b310 - block
    b618 - block
    b874 - block
    b822 - block
    b77 - block
    b363 - block
    b309 - block
    b63 - block
    b795 - block
    b571 - block
    b292 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b597 )
    ( on b783 b597 )
    ( on b601 b783 )
    ( on b369 b601 )
    ( on b210 b369 )
    ( on b225 b210 )
    ( on b125 b225 )
    ( on b454 b125 )
    ( on b310 b454 )
    ( on b618 b310 )
    ( on b874 b618 )
    ( on b822 b874 )
    ( on b77 b822 )
    ( on b363 b77 )
    ( on b309 b363 )
    ( on b63 b309 )
    ( on b795 b63 )
    ( on b571 b795 )
    ( on b292 b571 )
    ( clear b292 )
  )
  ( :goal
    ( and
      ( clear b597 )
    )
  )
)
