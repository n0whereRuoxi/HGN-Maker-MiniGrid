( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b456 - block
    b84 - block
    b96 - block
    b14 - block
    b860 - block
    b866 - block
    b11 - block
    b398 - block
    b833 - block
    b435 - block
    b170 - block
    b359 - block
    b689 - block
    b697 - block
    b593 - block
    b384 - block
    b882 - block
    b918 - block
    b316 - block
    b178 - block
    b942 - block
    b111 - block
    b997 - block
    b785 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b456 )
    ( on b84 b456 )
    ( on b96 b84 )
    ( on b14 b96 )
    ( on b860 b14 )
    ( on b866 b860 )
    ( on b11 b866 )
    ( on b398 b11 )
    ( on b833 b398 )
    ( on b435 b833 )
    ( on b170 b435 )
    ( on b359 b170 )
    ( on b689 b359 )
    ( on b697 b689 )
    ( on b593 b697 )
    ( on b384 b593 )
    ( on b882 b384 )
    ( on b918 b882 )
    ( on b316 b918 )
    ( on b178 b316 )
    ( on b942 b178 )
    ( on b111 b942 )
    ( on b997 b111 )
    ( on b785 b997 )
    ( clear b785 )
  )
  ( :goal
    ( and
      ( clear b456 )
    )
  )
)
