( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b986 - block
    b170 - block
    b468 - block
    b798 - block
    b988 - block
    b90 - block
    b488 - block
    b571 - block
    b50 - block
    b304 - block
    b578 - block
    b471 - block
    b963 - block
    b611 - block
    b358 - block
    b511 - block
    b231 - block
    b719 - block
    b520 - block
    b391 - block
    b758 - block
    b870 - block
    b56 - block
    b505 - block
    b515 - block
    b508 - block
    b553 - block
    b211 - block
    b721 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b986 )
    ( on b170 b986 )
    ( on b468 b170 )
    ( on b798 b468 )
    ( on b988 b798 )
    ( on b90 b988 )
    ( on b488 b90 )
    ( on b571 b488 )
    ( on b50 b571 )
    ( on b304 b50 )
    ( on b578 b304 )
    ( on b471 b578 )
    ( on b963 b471 )
    ( on b611 b963 )
    ( on b358 b611 )
    ( on b511 b358 )
    ( on b231 b511 )
    ( on b719 b231 )
    ( on b520 b719 )
    ( on b391 b520 )
    ( on b758 b391 )
    ( on b870 b758 )
    ( on b56 b870 )
    ( on b505 b56 )
    ( on b515 b505 )
    ( on b508 b515 )
    ( on b553 b508 )
    ( on b211 b553 )
    ( on b721 b211 )
    ( clear b721 )
  )
  ( :goal
    ( and
      ( clear b986 )
    )
  )
)
