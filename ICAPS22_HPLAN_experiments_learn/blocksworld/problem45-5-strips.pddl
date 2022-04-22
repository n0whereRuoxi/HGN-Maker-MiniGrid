( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b25 - block
    b486 - block
    b723 - block
    b200 - block
    b139 - block
    b328 - block
    b170 - block
    b679 - block
    b607 - block
    b544 - block
    b357 - block
    b842 - block
    b149 - block
    b966 - block
    b385 - block
    b668 - block
    b733 - block
    b784 - block
    b129 - block
    b116 - block
    b199 - block
    b179 - block
    b115 - block
    b823 - block
    b641 - block
    b336 - block
    b166 - block
    b780 - block
    b918 - block
    b208 - block
    b238 - block
    b130 - block
    b427 - block
    b708 - block
    b112 - block
    b305 - block
    b158 - block
    b92 - block
    b523 - block
    b889 - block
    b727 - block
    b546 - block
    b687 - block
    b524 - block
    b109 - block
    b920 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b25 )
    ( on b486 b25 )
    ( on b723 b486 )
    ( on b200 b723 )
    ( on b139 b200 )
    ( on b328 b139 )
    ( on b170 b328 )
    ( on b679 b170 )
    ( on b607 b679 )
    ( on b544 b607 )
    ( on b357 b544 )
    ( on b842 b357 )
    ( on b149 b842 )
    ( on b966 b149 )
    ( on b385 b966 )
    ( on b668 b385 )
    ( on b733 b668 )
    ( on b784 b733 )
    ( on b129 b784 )
    ( on b116 b129 )
    ( on b199 b116 )
    ( on b179 b199 )
    ( on b115 b179 )
    ( on b823 b115 )
    ( on b641 b823 )
    ( on b336 b641 )
    ( on b166 b336 )
    ( on b780 b166 )
    ( on b918 b780 )
    ( on b208 b918 )
    ( on b238 b208 )
    ( on b130 b238 )
    ( on b427 b130 )
    ( on b708 b427 )
    ( on b112 b708 )
    ( on b305 b112 )
    ( on b158 b305 )
    ( on b92 b158 )
    ( on b523 b92 )
    ( on b889 b523 )
    ( on b727 b889 )
    ( on b546 b727 )
    ( on b687 b546 )
    ( on b524 b687 )
    ( on b109 b524 )
    ( on b920 b109 )
    ( clear b920 )
  )
  ( :goal
    ( and
      ( clear b25 )
    )
  )
)
