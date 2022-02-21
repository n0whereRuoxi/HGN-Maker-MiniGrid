( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b798 - block
    b547 - block
    b832 - block
    b24 - block
    b514 - block
    b880 - block
    b223 - block
    b675 - block
    b695 - block
    b94 - block
    b209 - block
    b912 - block
    b519 - block
    b17 - block
    b300 - block
    b267 - block
    b875 - block
    b963 - block
    b317 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b798 )
    ( on b547 b798 )
    ( on b832 b547 )
    ( on b24 b832 )
    ( on b514 b24 )
    ( on b880 b514 )
    ( on b223 b880 )
    ( on b675 b223 )
    ( on b695 b675 )
    ( on b94 b695 )
    ( on b209 b94 )
    ( on b912 b209 )
    ( on b519 b912 )
    ( on b17 b519 )
    ( on b300 b17 )
    ( on b267 b300 )
    ( on b875 b267 )
    ( on b963 b875 )
    ( on b317 b963 )
    ( clear b317 )
  )
  ( :goal
    ( and
      ( clear b798 )
    )
  )
)
