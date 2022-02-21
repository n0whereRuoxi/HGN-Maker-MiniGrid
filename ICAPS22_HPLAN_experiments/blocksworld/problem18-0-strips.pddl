( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b250 - block
    b491 - block
    b397 - block
    b248 - block
    b627 - block
    b511 - block
    b913 - block
    b119 - block
    b963 - block
    b216 - block
    b872 - block
    b585 - block
    b268 - block
    b836 - block
    b797 - block
    b893 - block
    b887 - block
    b688 - block
    b63 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b250 )
    ( on b491 b250 )
    ( on b397 b491 )
    ( on b248 b397 )
    ( on b627 b248 )
    ( on b511 b627 )
    ( on b913 b511 )
    ( on b119 b913 )
    ( on b963 b119 )
    ( on b216 b963 )
    ( on b872 b216 )
    ( on b585 b872 )
    ( on b268 b585 )
    ( on b836 b268 )
    ( on b797 b836 )
    ( on b893 b797 )
    ( on b887 b893 )
    ( on b688 b887 )
    ( on b63 b688 )
    ( clear b63 )
  )
  ( :goal
    ( and
      ( clear b250 )
    )
  )
)
