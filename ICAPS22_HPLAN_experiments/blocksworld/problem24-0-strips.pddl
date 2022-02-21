( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b110 - block
    b814 - block
    b426 - block
    b132 - block
    b671 - block
    b540 - block
    b718 - block
    b817 - block
    b898 - block
    b539 - block
    b377 - block
    b940 - block
    b582 - block
    b282 - block
    b577 - block
    b864 - block
    b633 - block
    b983 - block
    b401 - block
    b619 - block
    b428 - block
    b740 - block
    b178 - block
    b560 - block
    b38 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b110 )
    ( on b814 b110 )
    ( on b426 b814 )
    ( on b132 b426 )
    ( on b671 b132 )
    ( on b540 b671 )
    ( on b718 b540 )
    ( on b817 b718 )
    ( on b898 b817 )
    ( on b539 b898 )
    ( on b377 b539 )
    ( on b940 b377 )
    ( on b582 b940 )
    ( on b282 b582 )
    ( on b577 b282 )
    ( on b864 b577 )
    ( on b633 b864 )
    ( on b983 b633 )
    ( on b401 b983 )
    ( on b619 b401 )
    ( on b428 b619 )
    ( on b740 b428 )
    ( on b178 b740 )
    ( on b560 b178 )
    ( on b38 b560 )
    ( clear b38 )
  )
  ( :goal
    ( and
      ( clear b110 )
    )
  )
)
