( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b732 - block
    b663 - block
    b773 - block
    b680 - block
    b408 - block
    b631 - block
    b504 - block
    b948 - block
    b17 - block
    b247 - block
    b578 - block
    b219 - block
    b403 - block
    b531 - block
    b83 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b732 )
    ( on b663 b732 )
    ( on b773 b663 )
    ( on b680 b773 )
    ( on b408 b680 )
    ( on b631 b408 )
    ( on b504 b631 )
    ( on b948 b504 )
    ( on b17 b948 )
    ( on b247 b17 )
    ( on b578 b247 )
    ( on b219 b578 )
    ( on b403 b219 )
    ( on b531 b403 )
    ( on b83 b531 )
    ( clear b83 )
  )
  ( :goal
    ( and
      ( clear b732 )
    )
  )
)
