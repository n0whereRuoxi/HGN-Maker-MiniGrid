( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b291 - block
    b648 - block
    b385 - block
    b926 - block
    b151 - block
    b262 - block
    b741 - block
    b977 - block
    b412 - block
    b884 - block
    b290 - block
    b202 - block
    b843 - block
    b595 - block
    b302 - block
    b753 - block
    b144 - block
    b496 - block
    b946 - block
    b932 - block
    b656 - block
    b840 - block
    b39 - block
    b780 - block
    b618 - block
    b871 - block
    b913 - block
    b460 - block
    b172 - block
    b359 - block
    b681 - block
    b231 - block
    b424 - block
    b296 - block
    b576 - block
    b528 - block
    b345 - block
    b476 - block
    b168 - block
    b103 - block
    b99 - block
    b862 - block
    b79 - block
    b477 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b291 )
    ( on b648 b291 )
    ( on b385 b648 )
    ( on b926 b385 )
    ( on b151 b926 )
    ( on b262 b151 )
    ( on b741 b262 )
    ( on b977 b741 )
    ( on b412 b977 )
    ( on b884 b412 )
    ( on b290 b884 )
    ( on b202 b290 )
    ( on b843 b202 )
    ( on b595 b843 )
    ( on b302 b595 )
    ( on b753 b302 )
    ( on b144 b753 )
    ( on b496 b144 )
    ( on b946 b496 )
    ( on b932 b946 )
    ( on b656 b932 )
    ( on b840 b656 )
    ( on b39 b840 )
    ( on b780 b39 )
    ( on b618 b780 )
    ( on b871 b618 )
    ( on b913 b871 )
    ( on b460 b913 )
    ( on b172 b460 )
    ( on b359 b172 )
    ( on b681 b359 )
    ( on b231 b681 )
    ( on b424 b231 )
    ( on b296 b424 )
    ( on b576 b296 )
    ( on b528 b576 )
    ( on b345 b528 )
    ( on b476 b345 )
    ( on b168 b476 )
    ( on b103 b168 )
    ( on b99 b103 )
    ( on b862 b99 )
    ( on b79 b862 )
    ( on b477 b79 )
    ( clear b477 )
  )
  ( :goal
    ( and
      ( clear b291 )
    )
  )
)
