( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b892 - block
    b490 - block
    b218 - block
    b734 - block
    b87 - block
    b62 - block
    b422 - block
    b618 - block
    b288 - block
    b213 - block
    b850 - block
    b803 - block
    b963 - block
    b251 - block
    b964 - block
    b661 - block
    b737 - block
    b217 - block
    b426 - block
    b720 - block
    b865 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b892 )
    ( on b490 b892 )
    ( on b218 b490 )
    ( on b734 b218 )
    ( on b87 b734 )
    ( on b62 b87 )
    ( on b422 b62 )
    ( on b618 b422 )
    ( on b288 b618 )
    ( on b213 b288 )
    ( on b850 b213 )
    ( on b803 b850 )
    ( on b963 b803 )
    ( on b251 b963 )
    ( on b964 b251 )
    ( on b661 b964 )
    ( on b737 b661 )
    ( on b217 b737 )
    ( on b426 b217 )
    ( on b720 b426 )
    ( on b865 b720 )
    ( clear b865 )
  )
  ( :tasks
    ( Make-20Pile b490 b218 b734 b87 b62 b422 b618 b288 b213 b850 b803 b963 b251 b964 b661 b737 b217 b426 b720 b865 )
  )
)
