( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b132 - block
    b864 - block
    b130 - block
    b963 - block
    b14 - block
    b292 - block
    b137 - block
    b124 - block
    b811 - block
    b291 - block
    b511 - block
    b609 - block
    b62 - block
    b672 - block
    b975 - block
    b175 - block
    b832 - block
    b421 - block
    b736 - block
    b723 - block
    b12 - block
    b901 - block
    b606 - block
    b457 - block
    b330 - block
    b647 - block
    b116 - block
    b196 - block
    b585 - block
    b309 - block
    b786 - block
    b902 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b132 )
    ( on b864 b132 )
    ( on b130 b864 )
    ( on b963 b130 )
    ( on b14 b963 )
    ( on b292 b14 )
    ( on b137 b292 )
    ( on b124 b137 )
    ( on b811 b124 )
    ( on b291 b811 )
    ( on b511 b291 )
    ( on b609 b511 )
    ( on b62 b609 )
    ( on b672 b62 )
    ( on b975 b672 )
    ( on b175 b975 )
    ( on b832 b175 )
    ( on b421 b832 )
    ( on b736 b421 )
    ( on b723 b736 )
    ( on b12 b723 )
    ( on b901 b12 )
    ( on b606 b901 )
    ( on b457 b606 )
    ( on b330 b457 )
    ( on b647 b330 )
    ( on b116 b647 )
    ( on b196 b116 )
    ( on b585 b196 )
    ( on b309 b585 )
    ( on b786 b309 )
    ( on b902 b786 )
    ( clear b902 )
  )
  ( :goal
    ( and
      ( clear b132 )
    )
  )
)
