( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b325 - block
    b919 - block
    b540 - block
    b726 - block
    b712 - block
    b70 - block
    b955 - block
    b344 - block
    b140 - block
    b261 - block
    b773 - block
    b273 - block
    b537 - block
    b801 - block
    b466 - block
    b417 - block
    b505 - block
    b949 - block
    b416 - block
    b385 - block
    b267 - block
    b274 - block
    b118 - block
    b529 - block
    b121 - block
    b569 - block
    b867 - block
    b32 - block
    b878 - block
    b670 - block
    b425 - block
    b500 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b325 )
    ( on b919 b325 )
    ( on b540 b919 )
    ( on b726 b540 )
    ( on b712 b726 )
    ( on b70 b712 )
    ( on b955 b70 )
    ( on b344 b955 )
    ( on b140 b344 )
    ( on b261 b140 )
    ( on b773 b261 )
    ( on b273 b773 )
    ( on b537 b273 )
    ( on b801 b537 )
    ( on b466 b801 )
    ( on b417 b466 )
    ( on b505 b417 )
    ( on b949 b505 )
    ( on b416 b949 )
    ( on b385 b416 )
    ( on b267 b385 )
    ( on b274 b267 )
    ( on b118 b274 )
    ( on b529 b118 )
    ( on b121 b529 )
    ( on b569 b121 )
    ( on b867 b569 )
    ( on b32 b867 )
    ( on b878 b32 )
    ( on b670 b878 )
    ( on b425 b670 )
    ( on b500 b425 )
    ( clear b500 )
  )
  ( :goal
    ( and
      ( clear b325 )
    )
  )
)
