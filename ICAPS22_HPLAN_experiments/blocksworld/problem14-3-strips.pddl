( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b551 - block
    b278 - block
    b893 - block
    b172 - block
    b885 - block
    b377 - block
    b905 - block
    b631 - block
    b163 - block
    b69 - block
    b358 - block
    b670 - block
    b862 - block
    b289 - block
    b152 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b551 )
    ( on b278 b551 )
    ( on b893 b278 )
    ( on b172 b893 )
    ( on b885 b172 )
    ( on b377 b885 )
    ( on b905 b377 )
    ( on b631 b905 )
    ( on b163 b631 )
    ( on b69 b163 )
    ( on b358 b69 )
    ( on b670 b358 )
    ( on b862 b670 )
    ( on b289 b862 )
    ( on b152 b289 )
    ( clear b152 )
  )
  ( :goal
    ( and
      ( clear b551 )
    )
  )
)
