( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b276 - block
    b519 - block
    b205 - block
    b658 - block
    b267 - block
    b337 - block
    b162 - block
    b159 - block
    b963 - block
    b764 - block
    b141 - block
    b744 - block
    b817 - block
    b862 - block
    b112 - block
    b500 - block
    b7 - block
    b678 - block
    b761 - block
    b844 - block
    b870 - block
    b921 - block
    b832 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b276 )
    ( on b519 b276 )
    ( on b205 b519 )
    ( on b658 b205 )
    ( on b267 b658 )
    ( on b337 b267 )
    ( on b162 b337 )
    ( on b159 b162 )
    ( on b963 b159 )
    ( on b764 b963 )
    ( on b141 b764 )
    ( on b744 b141 )
    ( on b817 b744 )
    ( on b862 b817 )
    ( on b112 b862 )
    ( on b500 b112 )
    ( on b7 b500 )
    ( on b678 b7 )
    ( on b761 b678 )
    ( on b844 b761 )
    ( on b870 b844 )
    ( on b921 b870 )
    ( on b832 b921 )
    ( clear b832 )
  )
  ( :goal
    ( and
      ( clear b276 )
    )
  )
)
