( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b915 - block
    b264 - block
    b567 - block
    b413 - block
    b987 - block
    b483 - block
    b726 - block
    b743 - block
    b744 - block
    b327 - block
    b685 - block
    b140 - block
    b453 - block
    b823 - block
    b759 - block
    b706 - block
    b70 - block
    b697 - block
    b6 - block
    b312 - block
    b105 - block
    b560 - block
    b545 - block
    b77 - block
    b592 - block
    b828 - block
    b856 - block
    b137 - block
    b228 - block
    b247 - block
    b299 - block
    b878 - block
    b268 - block
    b392 - block
    b764 - block
    b65 - block
    b352 - block
    b385 - block
    b463 - block
    b275 - block
    b240 - block
    b340 - block
    b911 - block
    b806 - block
    b782 - block
    b719 - block
    b865 - block
    b924 - block
    b98 - block
    b284 - block
    b609 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b915 )
    ( on b264 b915 )
    ( on b567 b264 )
    ( on b413 b567 )
    ( on b987 b413 )
    ( on b483 b987 )
    ( on b726 b483 )
    ( on b743 b726 )
    ( on b744 b743 )
    ( on b327 b744 )
    ( on b685 b327 )
    ( on b140 b685 )
    ( on b453 b140 )
    ( on b823 b453 )
    ( on b759 b823 )
    ( on b706 b759 )
    ( on b70 b706 )
    ( on b697 b70 )
    ( on b6 b697 )
    ( on b312 b6 )
    ( on b105 b312 )
    ( on b560 b105 )
    ( on b545 b560 )
    ( on b77 b545 )
    ( on b592 b77 )
    ( on b828 b592 )
    ( on b856 b828 )
    ( on b137 b856 )
    ( on b228 b137 )
    ( on b247 b228 )
    ( on b299 b247 )
    ( on b878 b299 )
    ( on b268 b878 )
    ( on b392 b268 )
    ( on b764 b392 )
    ( on b65 b764 )
    ( on b352 b65 )
    ( on b385 b352 )
    ( on b463 b385 )
    ( on b275 b463 )
    ( on b240 b275 )
    ( on b340 b240 )
    ( on b911 b340 )
    ( on b806 b911 )
    ( on b782 b806 )
    ( on b719 b782 )
    ( on b865 b719 )
    ( on b924 b865 )
    ( on b98 b924 )
    ( on b284 b98 )
    ( on b609 b284 )
    ( clear b609 )
  )
  ( :tasks
    ( Make-50Pile b264 b567 b413 b987 b483 b726 b743 b744 b327 b685 b140 b453 b823 b759 b706 b70 b697 b6 b312 b105 b560 b545 b77 b592 b828 b856 b137 b228 b247 b299 b878 b268 b392 b764 b65 b352 b385 b463 b275 b240 b340 b911 b806 b782 b719 b865 b924 b98 b284 b609 )
  )
)
