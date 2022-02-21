( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b866 - block
    b792 - block
    b936 - block
    b448 - block
    b833 - block
    b932 - block
    b95 - block
    b384 - block
    b249 - block
    b809 - block
    b736 - block
    b219 - block
    b78 - block
    b46 - block
    b653 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b866 )
    ( on b792 b866 )
    ( on b936 b792 )
    ( on b448 b936 )
    ( on b833 b448 )
    ( on b932 b833 )
    ( on b95 b932 )
    ( on b384 b95 )
    ( on b249 b384 )
    ( on b809 b249 )
    ( on b736 b809 )
    ( on b219 b736 )
    ( on b78 b219 )
    ( on b46 b78 )
    ( on b653 b46 )
    ( clear b653 )
  )
  ( :goal
    ( and
      ( clear b866 )
    )
  )
)
