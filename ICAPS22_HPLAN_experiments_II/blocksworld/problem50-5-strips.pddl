( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b231 - block
    b875 - block
    b69 - block
    b889 - block
    b414 - block
    b902 - block
    b346 - block
    b20 - block
    b966 - block
    b784 - block
    b986 - block
    b376 - block
    b365 - block
    b650 - block
    b747 - block
    b87 - block
    b123 - block
    b46 - block
    b874 - block
    b219 - block
    b806 - block
    b990 - block
    b937 - block
    b912 - block
    b975 - block
    b787 - block
    b347 - block
    b135 - block
    b94 - block
    b914 - block
    b575 - block
    b174 - block
    b591 - block
    b145 - block
    b504 - block
    b284 - block
    b486 - block
    b682 - block
    b517 - block
    b677 - block
    b143 - block
    b938 - block
    b849 - block
    b247 - block
    b424 - block
    b930 - block
    b66 - block
    b757 - block
    b52 - block
    b41 - block
    b511 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b231 )
    ( on b875 b231 )
    ( on b69 b875 )
    ( on b889 b69 )
    ( on b414 b889 )
    ( on b902 b414 )
    ( on b346 b902 )
    ( on b20 b346 )
    ( on b966 b20 )
    ( on b784 b966 )
    ( on b986 b784 )
    ( on b376 b986 )
    ( on b365 b376 )
    ( on b650 b365 )
    ( on b747 b650 )
    ( on b87 b747 )
    ( on b123 b87 )
    ( on b46 b123 )
    ( on b874 b46 )
    ( on b219 b874 )
    ( on b806 b219 )
    ( on b990 b806 )
    ( on b937 b990 )
    ( on b912 b937 )
    ( on b975 b912 )
    ( on b787 b975 )
    ( on b347 b787 )
    ( on b135 b347 )
    ( on b94 b135 )
    ( on b914 b94 )
    ( on b575 b914 )
    ( on b174 b575 )
    ( on b591 b174 )
    ( on b145 b591 )
    ( on b504 b145 )
    ( on b284 b504 )
    ( on b486 b284 )
    ( on b682 b486 )
    ( on b517 b682 )
    ( on b677 b517 )
    ( on b143 b677 )
    ( on b938 b143 )
    ( on b849 b938 )
    ( on b247 b849 )
    ( on b424 b247 )
    ( on b930 b424 )
    ( on b66 b930 )
    ( on b757 b66 )
    ( on b52 b757 )
    ( on b41 b52 )
    ( on b511 b41 )
    ( clear b511 )
  )
  ( :goal
    ( and
      ( clear b231 )
    )
  )
)
