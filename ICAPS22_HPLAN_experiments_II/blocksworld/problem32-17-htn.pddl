( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b878 - block
    b456 - block
    b447 - block
    b608 - block
    b886 - block
    b310 - block
    b935 - block
    b590 - block
    b815 - block
    b983 - block
    b262 - block
    b155 - block
    b471 - block
    b645 - block
    b407 - block
    b891 - block
    b778 - block
    b634 - block
    b100 - block
    b933 - block
    b21 - block
    b694 - block
    b852 - block
    b930 - block
    b23 - block
    b18 - block
    b153 - block
    b836 - block
    b349 - block
    b483 - block
    b428 - block
    b594 - block
    b183 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b878 )
    ( on b456 b878 )
    ( on b447 b456 )
    ( on b608 b447 )
    ( on b886 b608 )
    ( on b310 b886 )
    ( on b935 b310 )
    ( on b590 b935 )
    ( on b815 b590 )
    ( on b983 b815 )
    ( on b262 b983 )
    ( on b155 b262 )
    ( on b471 b155 )
    ( on b645 b471 )
    ( on b407 b645 )
    ( on b891 b407 )
    ( on b778 b891 )
    ( on b634 b778 )
    ( on b100 b634 )
    ( on b933 b100 )
    ( on b21 b933 )
    ( on b694 b21 )
    ( on b852 b694 )
    ( on b930 b852 )
    ( on b23 b930 )
    ( on b18 b23 )
    ( on b153 b18 )
    ( on b836 b153 )
    ( on b349 b836 )
    ( on b483 b349 )
    ( on b428 b483 )
    ( on b594 b428 )
    ( on b183 b594 )
    ( clear b183 )
  )
  ( :tasks
    ( Make-32Pile b456 b447 b608 b886 b310 b935 b590 b815 b983 b262 b155 b471 b645 b407 b891 b778 b634 b100 b933 b21 b694 b852 b930 b23 b18 b153 b836 b349 b483 b428 b594 b183 )
  )
)
