( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b346 - block
    b664 - block
    b115 - block
    b602 - block
    b14 - block
    b345 - block
    b590 - block
    b543 - block
    b692 - block
    b938 - block
    b40 - block
    b286 - block
    b351 - block
    b701 - block
    b324 - block
    b955 - block
    b818 - block
    b99 - block
    b865 - block
    b165 - block
    b121 - block
    b826 - block
    b893 - block
    b902 - block
    b965 - block
    b792 - block
    b318 - block
    b396 - block
    b889 - block
    b804 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b346 )
    ( on b664 b346 )
    ( on b115 b664 )
    ( on b602 b115 )
    ( on b14 b602 )
    ( on b345 b14 )
    ( on b590 b345 )
    ( on b543 b590 )
    ( on b692 b543 )
    ( on b938 b692 )
    ( on b40 b938 )
    ( on b286 b40 )
    ( on b351 b286 )
    ( on b701 b351 )
    ( on b324 b701 )
    ( on b955 b324 )
    ( on b818 b955 )
    ( on b99 b818 )
    ( on b865 b99 )
    ( on b165 b865 )
    ( on b121 b165 )
    ( on b826 b121 )
    ( on b893 b826 )
    ( on b902 b893 )
    ( on b965 b902 )
    ( on b792 b965 )
    ( on b318 b792 )
    ( on b396 b318 )
    ( on b889 b396 )
    ( on b804 b889 )
    ( clear b804 )
  )
  ( :goal
    ( and
      ( clear b346 )
    )
  )
)
