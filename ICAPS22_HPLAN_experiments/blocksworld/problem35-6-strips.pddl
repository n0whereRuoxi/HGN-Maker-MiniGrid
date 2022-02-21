( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b752 - block
    b421 - block
    b572 - block
    b643 - block
    b205 - block
    b415 - block
    b264 - block
    b955 - block
    b771 - block
    b184 - block
    b330 - block
    b458 - block
    b246 - block
    b15 - block
    b965 - block
    b329 - block
    b60 - block
    b774 - block
    b513 - block
    b768 - block
    b102 - block
    b791 - block
    b430 - block
    b655 - block
    b642 - block
    b826 - block
    b678 - block
    b338 - block
    b154 - block
    b671 - block
    b527 - block
    b118 - block
    b949 - block
    b758 - block
    b166 - block
    b512 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b752 )
    ( on b421 b752 )
    ( on b572 b421 )
    ( on b643 b572 )
    ( on b205 b643 )
    ( on b415 b205 )
    ( on b264 b415 )
    ( on b955 b264 )
    ( on b771 b955 )
    ( on b184 b771 )
    ( on b330 b184 )
    ( on b458 b330 )
    ( on b246 b458 )
    ( on b15 b246 )
    ( on b965 b15 )
    ( on b329 b965 )
    ( on b60 b329 )
    ( on b774 b60 )
    ( on b513 b774 )
    ( on b768 b513 )
    ( on b102 b768 )
    ( on b791 b102 )
    ( on b430 b791 )
    ( on b655 b430 )
    ( on b642 b655 )
    ( on b826 b642 )
    ( on b678 b826 )
    ( on b338 b678 )
    ( on b154 b338 )
    ( on b671 b154 )
    ( on b527 b671 )
    ( on b118 b527 )
    ( on b949 b118 )
    ( on b758 b949 )
    ( on b166 b758 )
    ( on b512 b166 )
    ( clear b512 )
  )
  ( :goal
    ( and
      ( clear b752 )
    )
  )
)
