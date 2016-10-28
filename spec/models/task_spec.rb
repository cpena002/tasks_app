require 'rails_helper'

RSpec.describe Task, type: :model do

  it "can be created and saved in  tasks_database" do
    task1 = Task.new(title: "Dishes", description: "Wash the damn dishes cArLoS!")
    task1.save
    t1 = Task.find_by_title("Dishes")
    expect(t1.save).to eq true
  end

  #As a programmer, I can create a new Task record with a title, which is a string, and description, which is a string.
  it "should have a title and a description" do
    task1 = Task.new(title: "Dishes", description: "Wash the damn dishes cArLoS!")
    task1.save
    t1 = Task.find_by_title("Dishes")
    expect(t1.save).to eq true
    expect(t1.title).to eq "Dishes"
    expect(t1.description).to eq "Wash the damn dishes cArLoS!"
  end

  #As a programmer, I can list all Task records.
  it "can list all task records" do
    task1 = Task.new(title: "Dishes", description: "Wash the damn dishes cArLoS!")
    task1.save
    t1 = Task.find_by_title("Dishes")
    task2 = Task.new(title: "Laundry", description: "Wash the damn clothes cArLoS!")
    task2.save
    t2 = Task.find_by_title("Laundry")

    expect(Task.all).to match_array [Task.find_by_title("Dishes"), Task.find_by_title("Laundry")] #.all returns an array. The array contains rows from the table tasks (aka instances from the class Task)which you need to load through the .find_by method. Task.find_by_title("Dishes") loads the specified row.
  end

  #As a programmer, I can set a Task record to done given the ID of the record.
  it "can set a Task record to done given the ID of the record." do
    task1 = Task.new(title: "Dishes", description: "Wash the damn dishes cArLoS!", done: 'false')
    task1.save
    t1 = Task.find_by_title("Dishes")
    task2 = Task.new(title: "Laundry", description: "Wash the damn clothes cArLoS!", done: 'false')
    task2.save
    t2 = Task.find(task2.id) #because we were unsure of the exact id of this row, instead of putting an integer as the id in parenths, I called the row saved in task2 and called the .id method on it, which returns an id integer and places that within the parenths
    expect(t2.done).to eq 'false'
  end

  #As a programmer, I can list all the records that are done.
  it "list all done tasks" do
    task1 = Task.new(title: "Dishes", description: "Wash the damn dishes cArLoS!", done: 'true')
    task1.save
    t1 = Task.find_by_title("Dishes")
    task2 = Task.new(title: "Laundry", description: "Wash the damn clothes cArLoS!", done: 'true')
    t2 = Task.find_by_title("Laundry")
    task3 = Task.new(title: "Dinner", description: "Cook the damn dinner cArLoS!", done: 'false')
    t2 = Task.find_by_title("Dinner")

    expect(Task.where(done: 'true')).to match_array [Task.new(title: "Laundry"), Task.find_by_title("Laundry") ]
  end
end
