( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b129 - block
    b850 - block
    b150 - block
    b957 - block
    b425 - block
    b532 - block
    b148 - block
    b243 - block
    b452 - block
    b87 - block
    b657 - block
    b82 - block
    b201 - block
    b661 - block
    b35 - block
    b875 - block
    b973 - block
    b546 - block
    b969 - block
    b637 - block
    b590 - block
    b459 - block
    b552 - block
    b816 - block
    b844 - block
    b870 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b129 )
    ( on b850 b129 )
    ( on b150 b850 )
    ( on b957 b150 )
    ( on b425 b957 )
    ( on b532 b425 )
    ( on b148 b532 )
    ( on b243 b148 )
    ( on b452 b243 )
    ( on b87 b452 )
    ( on b657 b87 )
    ( on b82 b657 )
    ( on b201 b82 )
    ( on b661 b201 )
    ( on b35 b661 )
    ( on b875 b35 )
    ( on b973 b875 )
    ( on b546 b973 )
    ( on b969 b546 )
    ( on b637 b969 )
    ( on b590 b637 )
    ( on b459 b590 )
    ( on b552 b459 )
    ( on b816 b552 )
    ( on b844 b816 )
    ( on b870 b844 )
    ( clear b870 )
  )
  ( :goal
    ( and
      ( clear b129 )
    )
  )
)
