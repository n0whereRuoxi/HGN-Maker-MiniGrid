( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b275 - block
    b618 - block
    b37 - block
    b626 - block
    b757 - block
    b982 - block
    b862 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b275 )
    ( on b618 b275 )
    ( on b37 b618 )
    ( on b626 b37 )
    ( on b757 b626 )
    ( on b982 b757 )
    ( on b862 b982 )
    ( clear b862 )
  )
  ( :tasks
    ( Make-6Pile b618 b37 b626 b757 b982 b862 )
  )
)
