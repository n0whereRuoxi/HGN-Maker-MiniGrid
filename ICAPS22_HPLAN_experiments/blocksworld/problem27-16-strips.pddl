( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b313 - block
    b760 - block
    b941 - block
    b303 - block
    b999 - block
    b101 - block
    b934 - block
    b185 - block
    b826 - block
    b438 - block
    b609 - block
    b80 - block
    b55 - block
    b214 - block
    b44 - block
    b553 - block
    b708 - block
    b572 - block
    b102 - block
    b125 - block
    b364 - block
    b952 - block
    b300 - block
    b83 - block
    b976 - block
    b739 - block
    b540 - block
    b473 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b313 )
    ( on b760 b313 )
    ( on b941 b760 )
    ( on b303 b941 )
    ( on b999 b303 )
    ( on b101 b999 )
    ( on b934 b101 )
    ( on b185 b934 )
    ( on b826 b185 )
    ( on b438 b826 )
    ( on b609 b438 )
    ( on b80 b609 )
    ( on b55 b80 )
    ( on b214 b55 )
    ( on b44 b214 )
    ( on b553 b44 )
    ( on b708 b553 )
    ( on b572 b708 )
    ( on b102 b572 )
    ( on b125 b102 )
    ( on b364 b125 )
    ( on b952 b364 )
    ( on b300 b952 )
    ( on b83 b300 )
    ( on b976 b83 )
    ( on b739 b976 )
    ( on b540 b739 )
    ( on b473 b540 )
    ( clear b473 )
  )
  ( :goal
    ( and
      ( clear b313 )
    )
  )
)
