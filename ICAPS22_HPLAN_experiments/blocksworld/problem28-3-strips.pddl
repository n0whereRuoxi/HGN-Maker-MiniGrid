( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b28 - block
    b935 - block
    b191 - block
    b123 - block
    b516 - block
    b814 - block
    b32 - block
    b501 - block
    b166 - block
    b91 - block
    b401 - block
    b435 - block
    b113 - block
    b392 - block
    b265 - block
    b767 - block
    b867 - block
    b289 - block
    b73 - block
    b855 - block
    b373 - block
    b663 - block
    b586 - block
    b691 - block
    b385 - block
    b377 - block
    b964 - block
    b851 - block
    b334 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b28 )
    ( on b935 b28 )
    ( on b191 b935 )
    ( on b123 b191 )
    ( on b516 b123 )
    ( on b814 b516 )
    ( on b32 b814 )
    ( on b501 b32 )
    ( on b166 b501 )
    ( on b91 b166 )
    ( on b401 b91 )
    ( on b435 b401 )
    ( on b113 b435 )
    ( on b392 b113 )
    ( on b265 b392 )
    ( on b767 b265 )
    ( on b867 b767 )
    ( on b289 b867 )
    ( on b73 b289 )
    ( on b855 b73 )
    ( on b373 b855 )
    ( on b663 b373 )
    ( on b586 b663 )
    ( on b691 b586 )
    ( on b385 b691 )
    ( on b377 b385 )
    ( on b964 b377 )
    ( on b851 b964 )
    ( on b334 b851 )
    ( clear b334 )
  )
  ( :goal
    ( and
      ( clear b28 )
    )
  )
)
