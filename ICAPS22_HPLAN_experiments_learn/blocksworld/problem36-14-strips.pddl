( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b133 - block
    b30 - block
    b207 - block
    b507 - block
    b4 - block
    b281 - block
    b24 - block
    b126 - block
    b888 - block
    b509 - block
    b758 - block
    b273 - block
    b272 - block
    b134 - block
    b786 - block
    b734 - block
    b93 - block
    b971 - block
    b973 - block
    b893 - block
    b36 - block
    b313 - block
    b342 - block
    b793 - block
    b949 - block
    b870 - block
    b695 - block
    b806 - block
    b796 - block
    b990 - block
    b489 - block
    b363 - block
    b300 - block
    b326 - block
    b939 - block
    b143 - block
    b136 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b133 )
    ( on b30 b133 )
    ( on b207 b30 )
    ( on b507 b207 )
    ( on b4 b507 )
    ( on b281 b4 )
    ( on b24 b281 )
    ( on b126 b24 )
    ( on b888 b126 )
    ( on b509 b888 )
    ( on b758 b509 )
    ( on b273 b758 )
    ( on b272 b273 )
    ( on b134 b272 )
    ( on b786 b134 )
    ( on b734 b786 )
    ( on b93 b734 )
    ( on b971 b93 )
    ( on b973 b971 )
    ( on b893 b973 )
    ( on b36 b893 )
    ( on b313 b36 )
    ( on b342 b313 )
    ( on b793 b342 )
    ( on b949 b793 )
    ( on b870 b949 )
    ( on b695 b870 )
    ( on b806 b695 )
    ( on b796 b806 )
    ( on b990 b796 )
    ( on b489 b990 )
    ( on b363 b489 )
    ( on b300 b363 )
    ( on b326 b300 )
    ( on b939 b326 )
    ( on b143 b939 )
    ( on b136 b143 )
    ( clear b136 )
  )
  ( :goal
    ( and
      ( clear b133 )
    )
  )
)
