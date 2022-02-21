( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b987 - block
    b28 - block
    b58 - block
    b801 - block
    b542 - block
    b450 - block
    b986 - block
    b709 - block
    b92 - block
    b861 - block
    b54 - block
    b382 - block
    b607 - block
    b979 - block
    b683 - block
    b68 - block
    b602 - block
    b322 - block
    b188 - block
    b371 - block
    b471 - block
    b973 - block
    b630 - block
    b19 - block
    b67 - block
    b239 - block
    b814 - block
    b681 - block
    b150 - block
    b463 - block
    b9 - block
    b960 - block
    b855 - block
    b226 - block
    b459 - block
    b516 - block
    b116 - block
    b298 - block
    b249 - block
    b367 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b987 )
    ( on b28 b987 )
    ( on b58 b28 )
    ( on b801 b58 )
    ( on b542 b801 )
    ( on b450 b542 )
    ( on b986 b450 )
    ( on b709 b986 )
    ( on b92 b709 )
    ( on b861 b92 )
    ( on b54 b861 )
    ( on b382 b54 )
    ( on b607 b382 )
    ( on b979 b607 )
    ( on b683 b979 )
    ( on b68 b683 )
    ( on b602 b68 )
    ( on b322 b602 )
    ( on b188 b322 )
    ( on b371 b188 )
    ( on b471 b371 )
    ( on b973 b471 )
    ( on b630 b973 )
    ( on b19 b630 )
    ( on b67 b19 )
    ( on b239 b67 )
    ( on b814 b239 )
    ( on b681 b814 )
    ( on b150 b681 )
    ( on b463 b150 )
    ( on b9 b463 )
    ( on b960 b9 )
    ( on b855 b960 )
    ( on b226 b855 )
    ( on b459 b226 )
    ( on b516 b459 )
    ( on b116 b516 )
    ( on b298 b116 )
    ( on b249 b298 )
    ( on b367 b249 )
    ( clear b367 )
  )
  ( :goal
    ( and
      ( clear b987 )
    )
  )
)
