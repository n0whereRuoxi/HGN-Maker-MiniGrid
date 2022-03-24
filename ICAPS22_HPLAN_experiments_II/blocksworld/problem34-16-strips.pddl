( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b769 - block
    b674 - block
    b288 - block
    b670 - block
    b262 - block
    b134 - block
    b159 - block
    b90 - block
    b588 - block
    b182 - block
    b367 - block
    b102 - block
    b191 - block
    b20 - block
    b453 - block
    b766 - block
    b414 - block
    b965 - block
    b618 - block
    b170 - block
    b207 - block
    b964 - block
    b401 - block
    b415 - block
    b563 - block
    b338 - block
    b477 - block
    b879 - block
    b326 - block
    b897 - block
    b491 - block
    b513 - block
    b519 - block
    b48 - block
    b23 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b769 )
    ( on b674 b769 )
    ( on b288 b674 )
    ( on b670 b288 )
    ( on b262 b670 )
    ( on b134 b262 )
    ( on b159 b134 )
    ( on b90 b159 )
    ( on b588 b90 )
    ( on b182 b588 )
    ( on b367 b182 )
    ( on b102 b367 )
    ( on b191 b102 )
    ( on b20 b191 )
    ( on b453 b20 )
    ( on b766 b453 )
    ( on b414 b766 )
    ( on b965 b414 )
    ( on b618 b965 )
    ( on b170 b618 )
    ( on b207 b170 )
    ( on b964 b207 )
    ( on b401 b964 )
    ( on b415 b401 )
    ( on b563 b415 )
    ( on b338 b563 )
    ( on b477 b338 )
    ( on b879 b477 )
    ( on b326 b879 )
    ( on b897 b326 )
    ( on b491 b897 )
    ( on b513 b491 )
    ( on b519 b513 )
    ( on b48 b519 )
    ( on b23 b48 )
    ( clear b23 )
  )
  ( :goal
    ( and
      ( clear b769 )
    )
  )
)
