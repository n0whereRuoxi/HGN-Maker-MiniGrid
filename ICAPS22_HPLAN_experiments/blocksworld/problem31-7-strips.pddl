( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b304 - block
    b997 - block
    b362 - block
    b994 - block
    b625 - block
    b718 - block
    b340 - block
    b133 - block
    b523 - block
    b979 - block
    b555 - block
    b871 - block
    b728 - block
    b491 - block
    b280 - block
    b69 - block
    b781 - block
    b740 - block
    b610 - block
    b428 - block
    b451 - block
    b937 - block
    b323 - block
    b198 - block
    b504 - block
    b261 - block
    b533 - block
    b39 - block
    b112 - block
    b103 - block
    b935 - block
    b680 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b304 )
    ( on b997 b304 )
    ( on b362 b997 )
    ( on b994 b362 )
    ( on b625 b994 )
    ( on b718 b625 )
    ( on b340 b718 )
    ( on b133 b340 )
    ( on b523 b133 )
    ( on b979 b523 )
    ( on b555 b979 )
    ( on b871 b555 )
    ( on b728 b871 )
    ( on b491 b728 )
    ( on b280 b491 )
    ( on b69 b280 )
    ( on b781 b69 )
    ( on b740 b781 )
    ( on b610 b740 )
    ( on b428 b610 )
    ( on b451 b428 )
    ( on b937 b451 )
    ( on b323 b937 )
    ( on b198 b323 )
    ( on b504 b198 )
    ( on b261 b504 )
    ( on b533 b261 )
    ( on b39 b533 )
    ( on b112 b39 )
    ( on b103 b112 )
    ( on b935 b103 )
    ( on b680 b935 )
    ( clear b680 )
  )
  ( :goal
    ( and
      ( clear b304 )
    )
  )
)
