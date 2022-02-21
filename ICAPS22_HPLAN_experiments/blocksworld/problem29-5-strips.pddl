( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b918 - block
    b405 - block
    b459 - block
    b123 - block
    b764 - block
    b278 - block
    b72 - block
    b125 - block
    b300 - block
    b651 - block
    b864 - block
    b728 - block
    b266 - block
    b375 - block
    b141 - block
    b873 - block
    b59 - block
    b441 - block
    b372 - block
    b406 - block
    b403 - block
    b817 - block
    b463 - block
    b261 - block
    b187 - block
    b292 - block
    b681 - block
    b13 - block
    b506 - block
    b559 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b918 )
    ( on b405 b918 )
    ( on b459 b405 )
    ( on b123 b459 )
    ( on b764 b123 )
    ( on b278 b764 )
    ( on b72 b278 )
    ( on b125 b72 )
    ( on b300 b125 )
    ( on b651 b300 )
    ( on b864 b651 )
    ( on b728 b864 )
    ( on b266 b728 )
    ( on b375 b266 )
    ( on b141 b375 )
    ( on b873 b141 )
    ( on b59 b873 )
    ( on b441 b59 )
    ( on b372 b441 )
    ( on b406 b372 )
    ( on b403 b406 )
    ( on b817 b403 )
    ( on b463 b817 )
    ( on b261 b463 )
    ( on b187 b261 )
    ( on b292 b187 )
    ( on b681 b292 )
    ( on b13 b681 )
    ( on b506 b13 )
    ( on b559 b506 )
    ( clear b559 )
  )
  ( :goal
    ( and
      ( clear b918 )
    )
  )
)
