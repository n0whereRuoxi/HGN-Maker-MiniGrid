( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b503 - block
    b752 - block
    b452 - block
    b657 - block
    b156 - block
    b987 - block
    b825 - block
    b91 - block
    b173 - block
    b161 - block
    b929 - block
    b152 - block
    b301 - block
    b749 - block
    b564 - block
    b109 - block
    b102 - block
    b628 - block
    b728 - block
    b837 - block
    b710 - block
    b892 - block
    b193 - block
    b434 - block
    b872 - block
    b44 - block
    b559 - block
    b190 - block
    b477 - block
    b119 - block
    b790 - block
    b730 - block
    b674 - block
    b370 - block
    b142 - block
    b946 - block
    b361 - block
    b304 - block
    b729 - block
    b910 - block
    b113 - block
    b211 - block
    b308 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b503 )
    ( on b752 b503 )
    ( on b452 b752 )
    ( on b657 b452 )
    ( on b156 b657 )
    ( on b987 b156 )
    ( on b825 b987 )
    ( on b91 b825 )
    ( on b173 b91 )
    ( on b161 b173 )
    ( on b929 b161 )
    ( on b152 b929 )
    ( on b301 b152 )
    ( on b749 b301 )
    ( on b564 b749 )
    ( on b109 b564 )
    ( on b102 b109 )
    ( on b628 b102 )
    ( on b728 b628 )
    ( on b837 b728 )
    ( on b710 b837 )
    ( on b892 b710 )
    ( on b193 b892 )
    ( on b434 b193 )
    ( on b872 b434 )
    ( on b44 b872 )
    ( on b559 b44 )
    ( on b190 b559 )
    ( on b477 b190 )
    ( on b119 b477 )
    ( on b790 b119 )
    ( on b730 b790 )
    ( on b674 b730 )
    ( on b370 b674 )
    ( on b142 b370 )
    ( on b946 b142 )
    ( on b361 b946 )
    ( on b304 b361 )
    ( on b729 b304 )
    ( on b910 b729 )
    ( on b113 b910 )
    ( on b211 b113 )
    ( on b308 b211 )
    ( clear b308 )
  )
  ( :tasks
    ( Make-42Pile b752 b452 b657 b156 b987 b825 b91 b173 b161 b929 b152 b301 b749 b564 b109 b102 b628 b728 b837 b710 b892 b193 b434 b872 b44 b559 b190 b477 b119 b790 b730 b674 b370 b142 b946 b361 b304 b729 b910 b113 b211 b308 )
  )
)
