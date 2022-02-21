( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b701 - block
    b828 - block
    b191 - block
    b973 - block
    b728 - block
    b657 - block
    b383 - block
    b393 - block
    b919 - block
    b671 - block
    b889 - block
    b590 - block
    b319 - block
    b990 - block
    b655 - block
    b40 - block
    b44 - block
    b367 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b701 )
    ( on b828 b701 )
    ( on b191 b828 )
    ( on b973 b191 )
    ( on b728 b973 )
    ( on b657 b728 )
    ( on b383 b657 )
    ( on b393 b383 )
    ( on b919 b393 )
    ( on b671 b919 )
    ( on b889 b671 )
    ( on b590 b889 )
    ( on b319 b590 )
    ( on b990 b319 )
    ( on b655 b990 )
    ( on b40 b655 )
    ( on b44 b40 )
    ( on b367 b44 )
    ( clear b367 )
  )
  ( :goal
    ( and
      ( clear b701 )
    )
  )
)
